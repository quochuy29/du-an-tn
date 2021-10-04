<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Color;
use App\Models\Gender;
use App\Models\PetAge;
use App\Models\PetBreed;
use App\Models\PetProductAge;
use App\Models\PetProducts;
use App\Models\ProductColor;
use App\Models\ProductGallery;
use App\Models\ProductTag;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Yajra\Datatables\Datatables;

class PetProductController extends Controller
{
    public function index(Request $request)
    {
        $pet = PetProducts::get();
        $category = Category::get();
        $color = Color::get();
        $breed = PetBreed::get();
        $gender = Gender::get();
        $age = PetAge::get();

        return view('admin.pet.index', compact('pet', 'category', 'color', 'breed', 'gender', 'age'));
    }
    public function getData(Request $request)
    {
        $pet = PetProducts::select('pet_products.*');
        return dataTables::of($pet)
            ->setRowId(function ($row) {
                return $row->id;
            })
            ->addIndexColumn()
            ->orderColumn('cate_id', function ($row, $order) {
                return $row->orderBy('category_id', $order);
            })
            ->orderColumn('status', function ($row, $order) {
                return $row->orderBy('status', $order);
            })
            ->addColumn('category_id', function ($row) use ($request) {
                return $row->categories->name;
            })
            ->addColumn('image', function ($row) {
                return '<img class="img-fluid" width="70" src="' . asset('storage/' . $row->image) . '" alt="">';
            })
            ->addColumn('status', function ($row) {
                if ($row->status == 1) {
                    return '<span class="badge badge-primary">Active</span>';
                } elseif ($row->status == 0) {
                    return '<span class="badge badge-danger">Deactive</span>';
                } else {
                    return '<span class="badge badge-danger">Sắp ra mắt</span>';
                }
            })
            ->addColumn('action', function ($row) {
                return '<a  class="btn btn-success" href="' . route('pet.edit', ["id" => $row->id]) . '"><i class="far fa-edit"></i></a>
                                    <a class="btn btn-danger" href="javascript:void(0);" onclick="deleteData(' . $row->id . ')"><i class="far fa-trash-alt"></i></a>
<a class="btn btn-primary" href="' . route("pet.detail", ["id" => $row->id]) . '"><i class="far fa-eye"></i></a>';
            })
            ->filter(function ($instance) use ($request) {
                if ($request->get('status') == '0' || $request->get('status') == '1' || $request->get('status') == '3') {
                    $instance->where('status', $request->get('status'));
                }

                if ($request->get('cate') != '') {
                    $instance->where('category_id', $request->get('cate'));
                }

                if ($request->get('gender') != '') {
                    $instance->where('gender_id', $request->get('gender'));
                }

                if ($request->get('breed') != '') {
                    $instance->where('breed_id', $request->get('breed'));
                }

                if ($request->get('color') != '') {
                    $instance->join('product_color', 'product_color.product_id', '=', 'pet_products.id')
                        ->where('product_color.color_id', $request->color);
                }

                if ($request->get('age') != '') {
                    $instance->join('pet_product_age', 'pet_product_age.pro_id', '=', 'pet_products.id')
                        ->where('pet_product_age.age_id', $request->age);
                }

                if (!empty($request->get('search'))) {
                    $instance->where(function ($w) use ($request) {
                        $search = $request->get('search');
                        $w->orWhere('name', 'LIKE', "%$search%")
                            ->orWhere('description', 'LIKE', "%$search%");
                    });
                }
            })
            ->rawColumns(['status', 'action', 'image'])
            ->make(true);
    }
    public function detail($id)
    {
        // $model = Book::find($id);
        // $model->load('galleries');
        // return view('admin.book.detail-book', ['detail' => $model]);
    }
    public function upload(Request $request)
    {
        $uploadImg = $request->file('file');
        $path = $uploadImg->storeAs('uploads/images', uniqid() . '.' . $uploadImg->extension());
        return json_encode(['location' => asset('storage/' . $path)]);
    }
    public function addForm()
    {
        $category = Category::get();
        $color = Color::get();
        $breed = PetBreed::get();
        $gender = Gender::get();
        $age = PetAge::get();

        return view('admin.pet.add-form', compact('category', 'color', 'breed', 'gender', 'age'));
    }


    public function saveAdd($id = null, Request $request)
    {
        $message = [
            'name.required' => "Hãy nhập vào tên sách",
            'name.unique' => "Tên thú cưng đã tồn tại",
            'slug.required' => "Hãy nhập vào từ khóa Slug",
            'category_id.required' => "Hãy chọn danh mục",
            'gender_id.required' => "Hãy chọn giới tính",
            'image.required' => 'Hãy chọn ảnh thú cưng',
            'image.mimes' => 'File ảnh không đúng định dạng (jpg, bmp, png, jpeg)',
            'image.max' => 'File ảnh không được quá 2MB',
            'price.required' => "Hãy nhập giá",
            'price.numeric' => "Giá sách phải là số",
            'age.required' => "Hãy nhập tuổi",
            'quantity.required' => "Hãy nhập số lượng sách",
            'quantity.numeric' => "Số lượng sách phải là số",
            'status.required' => "Hãy chọn trạng thái sách",
            'color.required' => "Hãy chọn thể màu sắc",
            'breed_id.required' => "Hãy chọn giống loài",
            'weight.numeric' => "Cân nặng sách phải là số",
            'galleries.required' => "Hãy chọn thư viện ảnh cho thú cưng",
            'galleries.*.mimes' => 'File ảnh không đúng định dạng (jpg, bmp, png, jpeg)',
            'galleries.*.max' => 'File ảnh không được quá 2MB',
        ];
        $validator = Validator::make(
            $request->all(),
            [
                'name' => [
                    'required',
                    Rule::unique('pet_products')->ignore($id)
                ],
                'image' => 'required|mimes:jpg,bmp,png,jpeg|max:2048',
                'slug' => 'required',
                'gender_id' => 'required',
                'category_id' => 'required',
                'price' => 'required|numeric',
                'status' => 'required',
                'age' => 'required',
                'quantity' => 'required|numeric',
                'color' => 'required',
                'weight' => 'required|numeric',
                'breed_id' => 'required',
                'galleries' => 'required',
                'galleries.*' => 'mimes:jpg,bmp,png,jpeg|max:2048'
            ],
            $message
        );

        if ($validator->fails()) {
            return response()->json(['status' => 0, 'error' => $validator->errors()]);
        } else {
            /*
            *Tạo sản phẩm
            */
            $model = new PetProducts();
            $model->fill($request->all());
            $model->color_id = 1;
            $model->new_id = 1;
            $model->coupons_id = 1;
            $model->age_id = 1;
            if ($request->image != '') {
                $path = $request->file('image')->storeAs('uploads/images', uniqid() . '-' . $request->image->getClientOriginalName());
                $model->image = $path;
            }
            $model->save();
            /*
            *Tạo thư viện cho sản phẩm
            */
            if ($request->has('galleries')) {
                foreach ($request->galleries as $i => $item) {
                    $galleryObj = new ProductGallery();
                    $galleryObj->category_id = $model->category_id;
                    $galleryObj->product_id = $model->id;
                    $galleryObj->order_no = $i + 1;
                    $galleryObj->url = $item->storeAs(
                        'uploads/gallery/' . $model->id,
                        uniqid() . '-' . $item->getClientOriginalName()
                    );
                    $galleryObj->save();
                }
            }
            /*
            *Tạo màu sắc cho sản phẩm
            */
            if ($request->color) {
                foreach ($request->color as $i => $a) {
                    $mod = new ProductColor();
                    $mod->color_id = $a;
                    $mod->product_id = $model->id;
                    $mod->quantity = $i + 1;
                    $mod->save();
                }
            }
            /*
            *Tạo tag sản phẩm
            */
            $tag = new ProductTag();
            $tag->category_id = $model->category_id;
            $tag->product_id = $model->id;
            $tag->breed_id = $model->breed_id;
            $tag->save();
            /*
            *Tạo tuổi sản phẩm
            */
            if ($request->age) {
                foreach ($request->age as $i => $a) {
                    $age = new PetProductAge();
                    $age->age_id = $a;
                    $age->pro_id = $model->id;
                    $age->quantity = $i + 1;
                    $age->save();
                }
            }
        }
        return response()->json(['status' => 1, 'success' => 'lú', 'url' => asset('admin/thu-cung')]);
    }

    public function editForm($id)
    {
        $category = Category::get();
        $color = Color::get();
        $breed = PetBreed::get();
        $gender = Gender::get();
        $age = PetAge::get();
        $model = PetProducts::find($id);
        $model->load('colors', 'agePets');
        if (!$model) {
            return redirect()->back();
        }

        return view('admin.pet.edit-form', compact('category', 'color', 'breed', 'gender', 'age', 'model'));
    }

    public function saveEdit($id, Request $request)
    {
        $message = [
            'name.required' => "Hãy nhập vào tên sách",
            'name.unique' => "Tên thú cưng đã tồn tại",
            'slug.required' => "Hãy nhập vào từ khóa Slug",
            'category_id.required' => "Hãy chọn danh mục",
            'gender_id.required' => "Hãy chọn giới tính",
            'image.required' => 'Hãy chọn ảnh thú cưng',
            'image.mimes' => 'File ảnh không đúng định dạng (jpg, bmp, png, jpeg)',
            'image.max' => 'File ảnh không được quá 2MB',
            'price.required' => "Hãy nhập giá",
            'price.numeric' => "Giá sách phải là số",
            'age.required' => "Hãy nhập tuổi",
            'quantity.required' => "Hãy nhập số lượng sách",
            'quantity.numeric' => "Số lượng sách phải là số",
            'status.required' => "Hãy chọn trạng thái sách",
            'color.required' => "Hãy chọn thể màu sắc",
            'breed_id.required' => "Hãy chọn giống loài",
            'weight.numeric' => "Cân nặng sách phải là số",
            'galleries.*.mimes' => 'File ảnh không đúng định dạng (jpg, bmp, png, jpeg)',
            'galleries.*.max' => 'File ảnh không được quá 2MB',
        ];
        $validator = Validator::make(
            $request->all(),
            [
                'name' => [
                    'required',
                    Rule::unique('pet_products')->ignore($id)
                ],
                'image' => 'mimes:jpg,bmp,png,jpeg|max:2048',
                'slug' => 'required',
                'gender_id' => 'required',
                'category_id' => 'required',
                'price' => 'required|numeric',
                'status' => 'required',
                'age' => 'required',
                'quantity' => 'required|numeric',
                'color' => 'required',
                'weight' => 'required|numeric',
                'breed_id' => 'required',
                'galleries.*' => 'mimes:jpg,bmp,png,jpeg|max:2048'
            ],
            $message
        );
        $model = PetProducts::find($id);

        if (!$model) {
            return redirect()->back();
        }
        if ($validator->fails()) {
            return response()->json(['status' => 0, 'error' => $validator->errors()]);
        } else {
            /*
            *Sửa sản phẩm
            */
            $model->fill($request->all());
            $model->color_id = 1;
            $model->new_id = 1;
            $model->coupons_id = 1;
            $model->age_id = 1;
            if ($request->image != '') {
                $path = $request->file('image')->storeAs('uploads/images', uniqid() . '-' . $request->image->getClientOriginalName());
                $model->image = $path;
            }
            $model->save();

            if ($request->has('removeGalleryIds')) {
                $strIds = rtrim($request->removeGalleryIds, '|');
                $lstIds = explode('|', $strIds);
                // xóa các ảnh vật lý
                $removeList = ProductGallery::whereIn('id', $lstIds)->get();
                foreach ($removeList as $gl) {
                    Storage::delete($gl->url);
                }

                ProductGallery::destroy($lstIds);
            }
            if ($request->has('galleries')) {
                foreach ($request->galleries as $i => $item) {
                    $galleryObj = new ProductGallery();
                    $galleryObj->category_id = $model->category_id;
                    $galleryObj->product_id = $model->id;
                    $galleryObj->order_no = $i + 1;
                    $galleryObj->url = $item->storeAs(
                        'uploads/gallery/' . $model->id,
                        uniqid() . '-' . $item->getClientOriginalName()
                    );
                    $galleryObj->save();
                }
            }
            if ($request->color) {
                $mod = ProductColor::where('product_id', $request->id);
                $mod->delete();
                foreach ($request->color as $i => $a) {
                    $mod = new ProductColor();
                    $mod->color_id = $a;
                    $mod->product_id = $model->id;
                    $mod->quantity = $i + 1;
                    $mod->save();
                }
            }

            if ($request->age) {
                $age = PetProductAge::where('pro_id', $request->id);
                $age->delete();
                foreach ($request->age as $i => $a) {
                    $age = new PetProductAge();
                    $age->age_id = $a;
                    $age->pro_id = $model->id;
                    $age->quantity = $i + 1;
                    $age->save();
                }
            }

            $tag = ProductTag::where('product_id', $request->id);
            $tag->delete();
            $tagNew = new ProductTag();
            $tagNew->category_id = $model->category_id;
            $tagNew->product_id = $model->id;
            $tagNew->breed_id = $model->breed_id;
            $tagNew->save();

            return response()->json(['status' => 1, 'success' => 'lú', 'url' => asset('admin/thu-cung')]);
        }
    }
    public function remove($id)
    {
        $model = PetProducts::find($id);

        if (!$model) {
            return redirect()->back();
        }

        $ProColor = ProductColor::where('product_id', $id)->delete();

        $ProAge = PetProductAge::where('pro_id', $id)->delete();

        $ProTag = ProductTag::where('product_id', $id)->delete();

        $model->delete();
        return response()->json(['success' => 'Xóa thú cưng thành công !']);
    }
}