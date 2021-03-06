<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Coupons;
use App\Models\CouponType;
use App\Models\DiscountType;
use App\Models\Product;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Yajra\Datatables\Datatables;

class CouponTypeController extends Controller
{
    public function index(Request $request)
    {
        $admin = Auth::user()->hasanyrole('Admin|Manager');
        return view('admin.couponType.index', compact('admin'));
    }

    public function getData(Request $request)
    {
        $couponType = CouponType::select('coupon_types.*');
        return dataTables::of($couponType)
            ->setRowId(function ($row) {
                return $row->id;
            })
            ->addColumn('checkbox', function ($row) {
                return '<input type="checkbox" name="checkPro" class="checkPro" value="' . $row->id . '" />';
            })
            ->addColumn('action', function ($row) {
                return '
                <span class="float-right">
                    <a  class="btn btn-success" href="' . route('couponType.edit', ["id" => $row->id]) . '"><i class="far fa-edit"></i></a>
                    <a class="btn btn-danger" href="javascript:void(0);" id="deleteUrl' . $row->id . '" data-url="' . route('couponType.remove', ["id" => $row->id]) . '" onclick="deleteData(' . $row->id . ')"><i class="far fa-trash-alt"></i></a>
                </span>';
            })
            ->filter(function ($instance) use ($request) {

                if (!empty($request->get('search'))) {
                    $instance->where(function ($w) use ($request) {
                        $search = $request->get('search');
                        $w->orWhere('name', 'LIKE', "%$search%");
                    });
                }
            })
            ->rawColumns(['action', 'checkbox'])
            ->make(true);
    }

    public function addForm()
    {
        return view('admin.couponType.add-form');
    }

    public function saveAdd(Request $request, $id = null)
    {
        $model = new CouponType();

        $message = [
            'name.required' => "H??y nh???p v??o ki???u khuy???n m??i",
            'name.unique' => "Ki???u khuy???n m??i ???? t???n t???i",
            'name.regex' => "Ki???u khuy???n m??i kh??ng t???n t???i s??? v?? c??c k?? hi???u ?????c bi???t",
            'name.min' => "Ki???u khuy???n m??i ??t nh???t 3 k?? t???",
        ];
        $validator = Validator::make(
            $request->all(),
            [
                'name' => [
                    'required',
                    'regex:/^[^\-\!\[\]\{\}\"\'\>\<\%\^\*\?\/\\\|\,\;\:\+\=\(\)\@\$\&\!\.\#\_0-9]*$/',
                    'min:3',
                    Rule::unique('coupon_types')->ignore($id)->whereNull('deleted_at'),
                    function ($attribute, $value, $fail) use ($request) {
                        $dupicate = CouponType::onlyTrashed()
                            ->where('name', 'like', '%' . $request->name . '%')
                            ->first();
                        if ($dupicate) {
                            if ($value == $dupicate->name) {
                                return $fail('Ki???u khuy???n m??i ???? t???n t???i trong th??ng r??c .
                             Vui l??ng nh???p th??ng tin m???i ho???c x??a d??? li???u trong th??ng r??c');
                            }
                        }
                    }
                ],
            ],
            $message
        );
        if ($validator->fails()) {
            return response()->json(['status' => 0, 'error' => $validator->errors(), 'url' => route('couponType.index')]);
        } else {
            $model->fill($request->all());
            $model->save();
        }
        return response()->json(['status' => 1, 'success' => 'success', 'url' => route('couponType.index'), 'message' => 'Th??m ki???u gi???m gi?? th??nh c??ng']);
    }
    public function editForm($id)
    {
        $model = CouponType::find($id);
        if (!$model) {
            return redirect()->back();
        }
        return view('admin.couponType.edit-form', compact('model'));
    }
    public function saveEdit($id, Request $request)
    {
        $model = CouponType::find($id);

        if (!$model) {
            return redirect()->back();
        }

        $message = [
            'name.required' => "H??y nh???p v??o ki???u khuy???n m??i",
            'name.unique' => "Ki???u khuy???n m??i ???? t???n t???i",
            'name.regex' => "Ki???u khuy???n m??i kh??ng t???n t???i s??? v?? c??c k?? hi???u ?????c bi???t",
            'name.min' => "Ki???u khuy???n m??i ??t nh???t 3 k?? t???",
        ];
        $validator = Validator::make(
            $request->all(),
            [
                'name' => [
                    'required',
                    'regex:/^[^\-\!\[\]\{\}\"\'\>\<\%\^\*\?\/\\\|\,\;\:\+\=\(\)\@\$\&\!\.\#\_0-9]*$/',
                    'min:3',
                    Rule::unique('coupon_types')->ignore($id)->whereNull('deleted_at'),
                    function ($attribute, $value, $fail) use ($request) {
                        $dupicate = CouponType::onlyTrashed()
                            ->where('name', 'like', '%' . $request->name . '%')
                            ->first();
                        if ($dupicate) {
                            if ($value == $dupicate->name) {
                                return $fail('Ki???u khuy???n m??i ???? t???n t???i trong th??ng r??c .
                             Vui l??ng nh???p th??ng tin m???i ho???c x??a d??? li???u trong th??ng r??c');
                            }
                        }
                    }
                ],
            ],
            $message
        );
        if ($validator->fails()) {
            return response()->json(['status' => 0, 'error' => $validator->errors(), 'url' => route('couponType.index')]);
        } else {
            $model->fill($request->all());
            $model->save();
        }
        return response()->json(['status' => 1, 'success' => 'success', 'url' => route('couponType.index'), 'message' => 'S???a ki???u gi???m gi?? th??nh c??ng']);
    }

    public function backup(Request $request)
    {
        $admin = Auth::user()->hasanyrole('Admin|Manager');
        return view('admin.couponType.back-up', compact('admin'));
    }

    public function getBackUp(Request $request)
    {
        $couponType = CouponType::onlyTrashed()->select('coupon_types.*');
        return dataTables::of($couponType)
            ->setRowId(function ($row) {
                return $row->id;
            })
            ->addColumn('checkbox', function ($row) {
                return '<input type="checkbox" name="checkPro" class="checkPro" value="' . $row->id . '" />';
            })
            ->addColumn('action', function ($row) {
                return '
                <span class="float-right">
                    <a  class="btn btn-success" href="javascript:void(0);" id="restoreUrl' . $row->id . '" data-url="' . route('couponType.restore', ["id" => $row->id]) . '" onclick="restoreData(' . $row->id . ')"><i class="fas fa-trash-restore"></i></a>
                    <a class="btn btn-danger" href="javascript:void(0);" id="deleteUrl' . $row->id . '" data-url="' . route('couponType.delete', ["id" => $row->id]) . '" onclick="removeForever(' . $row->id . ')"><i class="far fa-trash-alt"></i></a>
                </span>';
            })
            ->filter(function ($instance) use ($request) {

                if (!empty($request->get('search'))) {
                    $instance->where(function ($w) use ($request) {
                        $search = $request->get('search');
                        $w->orWhere('name', 'LIKE', "%$search%");
                    });
                }
            })
            ->rawColumns(['action', 'checkbox'])
            ->make(true);
    }

    public function remove($id)
    {
        $couponType = CouponType::withTrashed()->find($id);
        $couponType->with('coupons');
        if (empty($couponType)) {
            return response()->json(['success' => 'Gi???m gi?? kh??ng t???n t???i !', 'undo' => "Ho??n t??c th???t b???i !", "empty" => 'Ki???m tra l???i gi???m gi??']);
        }
        if ($couponType->coupons()->count() !== 0) {
            $couponType->coupons()->each(function ($coupon) {
                if ($coupon->category()->count() !== 0) {
                    $coupon->category()->each(function ($product) {

                        if($product->category_type_id == 1){
                            if ($product->breeds()->count() == 0) {
                                $product->products()->each(function ($related) {
                                    $related->galleries()->delete();
                                    $related->orderDetails()->where('product_type', 1)->delete();
                                    $related->reviews()->where('product_type', 1)->delete();
                                });
                            $product->products()->delete();
                            } else {

                                $product->breeds()->each(function ($related) {
                                    $related->products()->each(function ($related) {
                                        $related->galleries()->delete();
                                        $related->orderDetails()->where('product_type', 1)->delete();
                                        $related->reviews()->where('product_type', 1)->delete();
                                    });
                                    $related->products()->delete();
                                });
                                $product->breeds()->delete();
                                $product->products()->each(function ($related) {
                                    $related->galleries()->delete();
                                    $related->orderDetails()->where('product_type', 1)->delete();
                                    $related->reviews()->where('product_type', 1)->delete();
                                });
                                $product->products()->delete();
                            }
                        }elseif($product->category_type_id == 2){
                            $product->accessory()->each(function ($related) {
                                $related->galleries()->delete();
                                $related->orderDetails()->where('product_type', 2)->delete();
                                $related->reviews()->where('product_type', 2)->delete();
                            });
                            $product->accessory()->delete();
                        }
                    });

                    $coupon->category()->delete();
                }

                $coupon->products()->each(function ($related) {
                    $related->galleries()->delete();
                    $related->orderDetails()->where('product_type', 1)->delete();
                    $related->reviews()->where('product_type', 1)->delete();
                });

                $coupon->accessory()->each(function ($related) {
                    $related->galleries()->delete();
                    $related->orderDetails()->where('product_type', 2)->delete();
                    $related->reviews()->where('product_type', 2)->delete();
                });
                $coupon->accessory()->delete();
                $coupon->products()->delete();
                $coupon->couponUsage()->delete();
            });
        };
        $couponType->coupons()->delete();
        $couponType->delete();
        return response()->json(['success' => 'X??a ki???u gi???m gi?? th??nh c??ng !', 'undo' => "Ho??n t??c th??nh c??ng !"]);
    }

    public function restore($id)
    {
        $couponType = CouponType::withTrashed()->find($id);
        if (empty($couponType)) {
            return response()->json(['success' => 'Gi???m gi?? kh??ng t???n t???i !', 'undo' => "Ho??n t??c th???t b???i !", "empty" => 'Ki???m tra l???i b??i vi???t']);
        }
        if ($couponType->coupons()->count() !== 0) {
            $couponType->coupons()->each(function ($coupon) {
                if ($coupon->category()->count() !== 0) {
                    $coupon->category()->each(function ($product) {

                        if($product->category_type_id == 1){
                            if ($product->breeds()->count() == 0) {
                                $product->products()->each(function ($related) {
                                    $related->galleries()->restore();
                                    $related->orderDetails()->where('product_type', 1)->restore();
                                    $related->reviews()->where('product_type', 1)->restore();
                                    $related->category()->restore();
                                });
                            $product->products()->restore();
                            } else {

                                $product->breeds()->each(function ($related) {
                                    $related->products()->each(function ($related) {
                                        $related->galleries()->restore();
                                        $related->orderDetails()->where('product_type', 1)->restore();
                                        $related->reviews()->where('product_type', 1)->restore();
                                        $related->category()->restore();
                                    });
                                    $related->products()->restore();
                                });
                                $product->breeds()->restore();
                                $product->products()->each(function ($related) {
                                    $related->galleries()->restore();
                                    $related->orderDetails()->where('product_type', 1)->restore();
                                    $related->reviews()->where('product_type', 1)->restore();
                                    $related->category()->restore();
                                });
                                $product->products()->restore();
                            }
                        }elseif($product->category_type_id == 2){
                            $product->accessory()->each(function ($related) {
                                $related->galleries()->restore();
                                $related->orderDetails()->where('product_type', 2)->restore();
                                $related->reviews()->where('product_type', 2)->restore();
                                $related->category()->restore();
                            });
                            $product->accessory()->restore();
                        }
                    });

                    $coupon->category()->restore();
                }

                $coupon->products()->each(function ($related) {
                    $related->galleries()->restore();
                    $related->orderDetails()->where('product_type', 1)->restore();
                    $related->reviews()->where('product_type', 1)->restore();
                    $related->category()->restore();
                });

                $coupon->accessory()->each(function ($related) {
                    $related->galleries()->restore();
                    $related->orderDetails()->where('product_type', 2)->restore();
                    $related->reviews()->where('product_type', 2)->restore();
                    $related->category()->restore();
                });
                $coupon->accessory()->restore();
                $coupon->products()->restore();
                $coupon->couponUsage()->restore();
            });
        };
        $couponType->coupons()->restore();
        $couponType->restore();
        return response()->json(['success' => 'Kh??i ph???c ki???u gi???m gi?? th??nh c??ng !', 'undo' => "Ho??n t??c th??nh c??ng !"]);
    }

    public function delete($id)
    {
        $couponType = CouponType::withTrashed()->find($id);
        $couponType->with('coupons');
        if (empty($couponType)) {
            return response()->json(['success' => 'Ki???u gi???m gi?? kh??ng t???n t???i !', 'undo' => "Ho??n t??c th???t b???i !", "empty" => 'Ki???m tra l???i gi???m gi??']);
        }
        if ($couponType->coupons()->count() !== 0) {
            $couponType->coupons()->each(function ($coupon) {
                if ($coupon->category()->count() !== 0) {
                    $coupon->category()->each(function ($product) {

                        if($product->category_type_id == 1){
                            if ($product->breeds()->count() == 0) {
                                $product->products()->each(function ($related) {
                                    $related->galleries()->forceDelete();
                                    $related->orderDetails()->where('product_type', 1)->forceDelete();
                                    $related->reviews()->where('product_type', 1)->forceDelete();
                                });
                            $product->products()->forceDelete();
                            } else {

                                $product->breeds()->each(function ($related) {
                                    $related->products()->each(function ($related) {
                                        $related->galleries()->forceDelete();
                                        $related->orderDetails()->where('product_type', 1)->forceDelete();
                                        $related->reviews()->where('product_type', 1)->forceDelete();
                                    });
                                    $related->products()->forceDelete();
                                });
                                $product->breeds()->forceDelete();
                                $product->products()->each(function ($related) {
                                    $related->galleries()->forceDelete();
                                    $related->orderDetails()->where('product_type', 1)->forceDelete();
                                    $related->reviews()->where('product_type', 1)->forceDelete();
                                });
                                $product->products()->forceDelete();
                            }
                        }elseif($product->category_type_id == 2){
                            $product->accessory()->each(function ($related) {
                                $related->galleries()->forceDelete();
                                $related->orderDetails()->where('product_type', 2)->forceDelete();
                                $related->reviews()->where('product_type', 2)->forceDelete();
                            });
                            $product->accessory()->forceDelete();
                        }
                    });

                    $coupon->category()->forceDelete();
                }

                $coupon->products()->each(function ($related) {
                    $related->galleries()->forceDelete();
                    $related->orderDetails()->where('product_type', 1)->forceDelete();
                    $related->reviews()->where('product_type', 1)->forceDelete();
                });

                $coupon->accessory()->each(function ($related) {
                    $related->galleries()->forceDelete();
                    $related->orderDetails()->where('product_type', 2)->forceDelete();
                    $related->reviews()->where('product_type', 2)->forceDelete();
                });
                $coupon->accessory()->forceDelete();
                $coupon->products()->forceDelete();
                $coupon->couponUsage()->forceDelete();
            });
        }
        $couponType->coupons()->forceDelete();
        $couponType->forceDelete();
        return response()->json(['success' => 'X??a ki???u gi???m gi?? th??nh c??ng !']);
    }

    public function removeMultiple(Request $request)
    {
        $idAll = $request->allId;
        $couponType = CouponType::withTrashed()->whereIn('id', $idAll);

        if ($couponType->count() == 0) {
            return response()->json(['success' => 'X??a gi???ng lo??i th???t b???i !']);
        }
        $couponType->each(function ($coupons) {
            if ($coupons->coupons()->count() !== 0) {
                $coupons->coupons()->each(function ($coupon) {
                    if ($coupon->category()->count() !== 0) {
                        $coupon->category()->each(function ($product) {

                            if($product->category_type_id == 1){
                                if ($product->breeds()->count() == 0) {
                                    $product->products()->each(function ($related) {
                                        $related->galleries()->delete();
                                        $related->orderDetails()->where('product_type', 1)->delete();
                                        $related->reviews()->where('product_type', 1)->delete();
                                    });
                                    $product->products()->delete();
                                } else {

                                    $product->breeds()->each(function ($related) {
                                        $related->products()->each(function     ($related) {
                                            $related->galleries()->delete();
                                            $related->orderDetails()->where('product_type', 1)->delete();
                                            $related->reviews()->where('product_type', 1)->delete();
                                        });
                                        $related->products()->delete();
                                    });
                                    $product->breeds()->delete();
                                    $product->products()->each(function ($related) {
                                        $related->galleries()->delete();
                                        $related->orderDetails()->where('product_type', 1)->delete();
                                        $related->reviews()->where('product_type', 1)->delete();
                                    });
                                    $product->products()->delete();
                                }
                            }elseif($product->category_type_id == 2){
                                $product->accessory()->each(function ($related) {
                                    $related->galleries()->delete();
                                    $related->orderDetails()->where('product_type', 2)->delete();
                                    $related->reviews()->where('product_type', 2)->delete();
                                });
                                $product->accessory()->delete();
                            }
                        });

                        $coupon->category()->delete();
                    }

                    $coupon->products()->each(function ($related) {
                        $related->galleries()->delete();
                        $related->orderDetails()->where('product_type', 1)->delete();
                        $related->reviews()->where('product_type', 1)->delete();
                    });

                    $coupon->accessory()->each(function ($related) {
                        $related->galleries()->delete();
                        $related->orderDetails()->where('product_type', 2)->delete();
                        $related->reviews()->where('product_type', 2)->delete();
                    });
                    $coupon->accessory()->delete();
                    $coupon->products()->delete();
                    $coupon->couponUsage()->delete();
                });
            };
            $coupons->coupons()->delete();
        });
        $couponType->delete();

        return response()->json(['success' => 'X??a ki???u gi???m gi?? th??nh c??ng !']);
    }

    public function restoreMultiple(Request $request)
    {
        $idAll = $request->allId;
        $couponType = CouponType::withTrashed()->whereIn('id', $idAll);

        if ($couponType->count() == 0) {
            return response()->json(['success' => 'Kh??i ph???c ki???u gi???m gi?? th???t b???i !']);
        }
        $couponType->each(function ($coupons) {
            if ($coupons->coupons()->count() !== 0) {
                $coupons->coupons()->each(function ($coupon) {
                    if ($coupon->category()->count() !== 0) {
                        $coupon->category()->each(function ($product) {
                            
                            if($product->category_type_id == 1){
                                if ($product->breeds()->count() == 0) {
                                    $product->products()->each(function ($related) {
                                        $related->galleries()->restore();
                                        $related->orderDetails()->where('product_type', 1)->restore();
                                        $related->reviews()->where('product_type', 1)->restore();
                                        $related->category()->restore();
                                    });
                                    $product->products()->restore();
                                } else {

                                    $product->breeds()->each(function ($related) {
                                        $related->products()->each(function     ($related) {
                                            $related->galleries()->restore();
                                            $related->orderDetails()->where('product_type', 1)->restore();
                                            $related->reviews()->where('product_type', 1)->restore();
                                            $related->category()->restore();
                                        });
                                        $related->products()->restore();
                                    });
                                    $product->breeds()->restore();
                                    $product->products()->each(function ($related) {
                                        $related->galleries()->restore();
                                        $related->orderDetails()->where('product_type', 1)->restore();
                                        $related->reviews()->where('product_type', 1)->restore();
                                        $related->category()->restore();
                                    });
                                    $product->products()->restore();
                                }
                            }elseif($product->category_type_id == 2){
                                $product->accessory()->each(function ($related) {
                                    $related->galleries()->restore();
                                    $related->orderDetails()->where('product_type', 2)->restore();
                                    $related->reviews()->where('product_type', 2)->restore();
                                    $related->category()->restore();
                                });
                                $product->accessory()->restore();
                            }
                        });

                        $coupon->category()->restore();
                    }

                    $coupon->products()->each(function ($related) {
                        $related->galleries()->restore();
                        $related->orderDetails()->where('product_type', 1)->restore();
                        $related->reviews()->where('product_type', 1)->restore();
                        $related->category()->restore();
                    });

                    $coupon->accessory()->each(function ($related) {
                         $related->galleries()->restore();
                        $related->orderDetails()->where('product_type', 2)->restore();
                        $related->reviews()->where('product_type', 2)->restore();
                        $related->category()->restore();
                    });
                    $coupon->accessory()->restore();
                    $coupon->products()->restore();
                    $coupon->couponUsage()->restore();
                });
            };
            $coupons->coupons()->restore();
        });
        $couponType->restore();

        return response()->json(['success' => 'Kh??i ph???c ki???u gi???m gi?? th??nh c??ng !']);
    }

    public function deleteMultiple(Request $request)
    {
        $idAll = $request->allId;
        $couponType = CouponType::withTrashed()->whereIn('id', $idAll);

        if ($couponType->count() == 0) {
            return response()->json(['success' => 'X??a ki???u gi???m gi?? th???t b???i !']);
        }

        $couponType->each(function ($coupons) {
            if ($coupons->coupons()->count() !== 0) {
                $coupons->coupons()->each(function ($coupon) {
                    if ($coupon->category()->count() !== 0) {
                        $coupon->category()->each(function ($product) {

                            if($product->category_type_id == 1){
                                if ($product->breeds()->count() == 0) {
                                    $product->products()->each(function ($related) {
                                        $related->galleries()->forceDelete();
                                        $related->orderDetails()->where('product_type', 1)->forceDelete();
                                        $related->reviews()->where('product_type', 1)->forceDelete();
                                    });
                                    $product->products()->forceDelete();
                                } else {

                                    $product->breeds()->each(function ($related) {
                                        $related->products()->each(function     ($related) {
                                            $related->galleries()->forceDelete();
                                            $related->orderDetails()->where('product_type', 1)->forceDelete();
                                            $related->reviews()->where('product_type', 1)->forceDelete();
                                        });
                                        $related->products()->forceDelete();
                                    });
                                    $product->breeds()->forceDelete();
                                    $product->products()->each(function ($related) {
                                        $related->galleries()->forceDelete();
                                        $related->orderDetails()->where('product_type', 1)->forceDelete();
                                        $related->reviews()->where('product_type', 1)->forceDelete();
                                    });
                                    $product->products()->forceDelete();
                                }
                            }elseif($product->category_type_id == 2){
                                $product->accessory()->each(function ($related) {
                                    $related->galleries()->forceDelete();
                                    $related->orderDetails()->where('product_type', 2)->forceDelete();
                                    $related->reviews()->where('product_type', 2)->forceDelete();
                                });
                                $product->accessory()->forceDelete();
                            }
                        });

                        $coupon->category()->forceDelete();
                    }

                    $coupon->products()->each(function ($related) {
                        $related->galleries()->forceDelete();
                        $related->orderDetails()->where('product_type', 1)->forceDelete();
                        $related->reviews()->where('product_type', 1)->forceDelete();
                    });

                    $coupon->accessory()->each(function ($related) {
                         $related->galleries()->forceDelete();
                        $related->orderDetails()->where('product_type', 2)->forceDelete();
                        $related->reviews()->where('product_type', 2)->forceDelete();
                    });
                    $coupon->accessory()->forceDelete();
                    $coupon->products()->forceDelete();
                    $coupon->couponUsage()->forceDelete();
                });
            };
            $coupons->coupons()->forceDelete();
        });
        $couponType->forceDelete();

        return response()->json(['success' => 'X??a ki???u gi???m gi?? th??nh c??ng !']);
    }
}