<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Product;
use App\Models\Accessory;
use Illuminate\Support\Facades\Mail;
use Yajra\Datatables\Datatables;
use App\Mail\SendMailUpdateStatusOrder;
use App\Models\GeneralSetting;

class OrderController extends Controller
{
    public function index(Request $request)
    {
        return view('admin.order.index');
    }

    public function getData(Request $request)
    {
        $order = Order::select('orders.*')->orderBy('created_at', 'DESC');
        return dataTables::of($order)
            ->addIndexColumn()
            ->addColumn('action', function ($row) {
                return '
                <span class="float-right">
                    <a href="' . route('order.detail', ['id' => $row->id]) . '" class="btn btn-outline-info"><i class="far fa-eye"></i></a>
                    <a  class="btn btn-success" href="' . route('order.edit', ["id" => $row->id]) . '"><i class="far fa-edit"></i></a>
                </span>';
            })
            ->filter(function ($instance) use ($request) {
                if ($request->get('delivery_status') == '0' || $request->get('delivery_status') == '1' || $request->get('delivery_status') == '2' || $request->get('delivery_status') == '3') {
                    $instance->where('delivery_status', $request->get('delivery_status'));
                }

                if ($request->get('payment_status') == '1' || $request->get('payment_status') == '2') {
                    $instance->where('payment_status', $request->get('payment_status'));
                }
                if (!empty($request->get('search'))) {
                    $instance->where(function ($w) use ($request) {
                        $search = $request->get('search');
                        $w->orWhere('name', 'LIKE', "%$search%")
                            ->orWhere('phone', 'LIKE', "%$search%")
                            ->orWhere('email', 'LIKE', "%$search%");
                    });
                }
            })
            ->rawColumns(['status', 'action'])
            ->make(true);
    }

    public function editForm($id)
    {
        $order = Order::find($id);

        if (!$order) {
            return redirect()->back();
        }
        $orderDetail = OrderDetail::where('order_id', $id)->get();
        return view('admin.order.edit-form', compact('order', 'orderDetail'));
    }

    public function saveEdit($id, Request $request)
    {
        $order = Order::find($id);

        $check_delivery_order = $order->delivery_status;
        $delivery_post_request = $request->delivery_status;

        if (!$order) {
            return redirect()->back()->with('danger', "Kh??ng t??m th???y ????n h??ng n??y!");
        }
        if ($order->delivery_status == 4) {
            return redirect(route('order.index'))->with('danger', "Kh??ng th??? c???p nh???t ????n h??ng n??y do Kh??ch h??ng ???? h???y ????n!");
        }

        if ($delivery_post_request == 3) {
            if ($check_delivery_order == 2) {
                $order->fill($request->all());
                $order->seller_id = Auth::user()->id;
            } elseif ($check_delivery_order == 3) {
                $order->fill($request->all());
                $order->seller_id = Auth::user()->id;
            } else {
                return redirect()->back()->with('danger', "Y??u c???u chuy???n tr???ng th??i ????n h??ng sang `??ang giao h??ng` Tr?????c khi c???p nh???t tr???ng th??i th??nh `Giao h??ng th??nh c??ng`. C???p nh???t th???t b???i!");
            }
        } else {
            $order->fill($request->all());
            $order->seller_id = Auth::user()->id;
        }

        $order_detail = OrderDetail::where('order_id', $id)->get();

        $order_detail = OrderDetail::where('order_id', $id)->get();
        
        foreach ($order_detail as $key => $value) {
            // T???o v??ng l???p c???p nh???t l???i tr???ng th??i chuy???n h??ng v?? thanh to??n d???ng text cho OrderDetail
            $orderDetail = OrderDetail::find($value->id);
            if ($order->payment_status == 1) {
                $orderDetail->payment_status = "Ch??a thanh to??n";
            } elseif ($order->payment_status == 2) {
                $orderDetail->payment_status = "???? thanh to??n";
            } else {
                $orderDetail->payment_status = "L???i code";
            }
            if ($order->delivery_status == 1) {
                $orderDetail->delivery_status = "??ang ch??? x??? l??";
            } elseif ($order->delivery_status == 2) {
                $orderDetail->delivery_status = "??ang giao h??ng";
            } elseif ($order->delivery_status == 3) {
                $orderDetail->delivery_status = "Giao h??ng th??nh c??ng";
            } elseif ($order->delivery_status == 0) {
                $orderDetail->delivery_status = "H???y ????n h??ng";
            } else {
                $orderDetail->delivery_status = "L???i code";
            }
            $orderDetail->save();
            if ($check_delivery_order == 0 && $delivery_post_request == 2) {
                if ($value->product_type == 1) {
                    $product = Product::find($value->product_id);
                } else {
                    $product = Accessory::find($value->product_id);
                }
                if ($product->quantity < $value->quantity || $product->quantity <= 0) {
                    return redirect()->back()->with('danger', "S??? l?????ng c???a s???n ph???m `" . $product->name .  "` hi???n t???i c??n `" . $product->quantity . "` s???n ph???m. Kh??ng ????? s??? l?????ng s???n ph???m ????? nh???n ????n h??ng n??y!");
                }
                $tru = $product->quantity - $value->quantity;
                $product->quantity = $tru;
                $product->save();
            }

            if ($delivery_post_request == 0 && $check_delivery_order != 0) {
                if ($value->product_type == 1) {
                    $product = Product::find($value->product_id);
                } else {
                    $product = Accessory::find($value->product_id);
                }
                $cong = $product->quantity + $value->quantity;
                $product->quantity = $cong;
                $product->save();
            }
        }
        $order->save();

        // G???i mail c???p nh???t tr???ng th??i ????n h??ng
        if ($request->has('send_mail')) {
            $OrderDetail = OrderDetail::where('order_id', $id)->get();
            $product = Product::all();
            $generalSetting = GeneralSetting::first('logo');
            $accessory = Accessory::all();
            // dd($generalSetting);
            $tax = 0;
            $total = 0;
            foreach ($OrderDetail as $key => $value) {
                $total += $value->price;
            }
            $name_client = $order->name;
            $number_phone = $order->phone;
            $to_email = $order->email;
            $order_code = $order->code;
            $date_time_order = $order->created_at->format('d/m/Y');
            $shipping_address = $order->shipping_address;
            $number_quantity_product_order = count($OrderDetail);
            $total = number_format($total, 0, ',', '.');
            $tax = number_format($tax, 0, ',', '.');
            $grand_total = number_format($order->grand_total, 0, ',', '.');

            // dd($name_client, $to_email, $order_code, $date_time_order, $shipping_address, $number_quantity_product_order, $grand_total);
            if ($order->delivery_status == 1) {
                $delivery_status = '???? ti???p nh???n ????n h??ng. ??ang ch??? x??? l??!';
            } elseif ($order->delivery_status == 2) {
                $delivery_status = '????n h??ng c???a b???n ???? ???????c g???i';
            } elseif ($order->delivery_status == 3) {
                $delivery_status = 'Ho??n th??nh ????n h??ng!';
            } else {
                $delivery_status = '????n h??ng c???a b???n ???? b??? h???y!';
            }

            $mailData = [
                'name_client' => $name_client,
                'number_phone' => $number_phone,
                'to_email' => $to_email,
                'order_code' => $order_code,
                'date_time_order' => $date_time_order,
                'number_quantity_product_order' => $number_quantity_product_order,
                'shipping_address' => $shipping_address,
                'grand_total' => $grand_total,
                'orderDetail' => $OrderDetail,
                'product' => $product,
                'accessory' => $accessory,
                'tax' => $tax,
                'total' => $total,
                'generalSetting' => $generalSetting,
                'delivery_status' => $delivery_status
            ];
            $toMail = $to_email;
            Mail::to($toMail)->send(new SendMailUpdateStatusOrder($mailData));
        }
        return redirect(route('order.index'))->with('success', "C???p nh???t ????n h??ng " . $order->code . " th??nh c??ng");
    }

    public function detail($id, Request $request)
    {
        $order = Order::find($id);
        if (!$order) {
            return redirect()->back();
        }
        $orderDetail = OrderDetail::where('order_id', $id)->get();
        return view('admin.order.detail', compact('order', 'orderDetail'));
    }
}