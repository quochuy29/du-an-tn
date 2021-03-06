<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Send mail Order</title>
    <style>
        * {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            outline: none;
            border: none;
            text-decoration: none;
        }
        .container{
            max-width: 40rem;
            padding: 1rem;
            border: 0.1rem solid #f5f6f8;
            border-radius: 0.5rem;
            box-shadow: 1px 1px 1px #868080;
            background-color: #fff;
            margin: 1rem auto;
        }
        .container .logo{
            text-align: center;
        }
        .container .logo img{
            height: 5rem;
        }
        .container .thanks{
            font-size: 1rem;
            text-align: center;
            color: #6bb64a;
            margin: 1rem 0;
        }
        .container h2{
            line-height: 2;
        }

        .container .title{
            font-size: 1rem;
            line-height: 1.5;
            margin-bottom: 1rem;
        }

        .container .button{
            text-align: center;
        }
        .container .button a{
            position: relative;
            display: inline-block;
            padding: 1rem 2rem;
            font-size: 1rem;
            text-decoration: none;
            text-transform: uppercase;
            color: #fff;
            border-radius: 0.5rem;
            letter-spacing: 2px;
            overflow: hidden;
            background: linear-gradient(90deg,#6bb64a,#ccff33);
        }
        .bold{
            font-weight: bold;
        }
        .text-red{
            color: #F62217;
        }

        .container .note{
            padding: 1rem 0;
            line-height: 1.5;
        }
        .container table tbody tr td{
            line-height: 2;
            color: #868080;
        }
        .container table tbody tr td a{
            color: #1155cc;
        }
        .detail{
            padding-top: 1rem;
        }
        .detail p{
            line-height: 1.5;
        }
        .detail .space-between{
            padding-top: 0.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .container .product{
            padding: 1rem 0;
        }
        .container .totail table{
            border-bottom:1px solid #d8d8d8;
        }
        .container .delivery_status{
            padding-top: 1rem;
        }
        .container .footer{
            text-align: center;
            padding-top: 1rem;
        }
        .container .footer a{
            position: relative;
            display: block;
            padding: 1rem 2rem;
            font-size: 1rem;
            text-decoration: none;
            text-transform: uppercase;
            color: #fff;
            border-radius: 0.5rem;
            letter-spacing: 2px;
            overflow: hidden;
            background: linear-gradient(90deg,#6bb64a,#ccff33);
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="logo">
            <a href="https://lolipet.xyz/">
                <img src="{{asset('storage/' . $feedback['generalSetting'])}}" alt="">
            </a>
        </div>
        <p class="thanks">C??m ??n b???n ???? ?????t h??ng t???i LoliPetVN!</p>
        <h2>Xin ch??o {{$feedback['name_client']}},</h2>
        <p class="title">
            Ch??ng t??i ???? nh???n ???????c y??u c???u ?????t h??ng c???a b???n v?? ??ang x??? l??. B???n s??? nh???n ???????c th??ng b??o ti???p theo khi ????n h??ng ???? s???n s??ng ???????c giao.
        </p>
        <div class="button">
            <a href="{{ route('orderStatus',['code'=>$feedback['order_code']]) }}" class="bold" id="link">T??NH TR???NG ????N H??NG</a>
        </div>
        <p class="note">
            <span class="bold">*L??u ??: </span>
            B???n ch??? n??n nh???n h??ng khi tr???ng th??i ????n h??ng l?? <span class="bold">??ang giao h??ng </span> v?? nh??? ki???m tra <span class="bold">M?? ????n h??ng</span>. Th??ng tin ng?????i g???i ????? nh???n ????ng ki???n h??ng nh??.
        </p>
        <div class="content">
            <p>????n h??ng ???????c giao ?????n:</p>
            <table cellpadding="2" cellspacing="0" width="100%">
                <tbody>
                   <tr>
                        <td width="25%" valign="top" class="bold">T??n:</td>
                        <td valign="top">{{$feedback['name_client']}}</td>
                   </tr>
                    <tr>
                        <td valign="top" class="bold">?????a ch??? giao h??ng:</td>
                        <td valign="top">{{$feedback['shipping_address']}}</td>
                    </tr>
                    <tr>
                        <td valign="top" class="bold">??i???n tho???i:</td>
                        <td valign="top">{{$feedback['number_phone']}}</td>
                    </tr>
                    <tr>
                        <td valign="top" class="bold">Email:</td>
                        <td valign="top"><a href="{{$feedback['to_email']}}" target="_blank">{{$feedback['to_email']}}</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="detail">
            <p>M?? ????n h??ng: {{$feedback['order_code']}}</p>
            <div class="space-between">
                <span>?????t v??o: {{$feedback['date_time_order']}}</span>
            </div>
            <div class="product">
                <table cellpadding="0" cellspacing="0" style="width:100%">
                    <tbody>
                        @foreach($feedback['orderDetail'] as $value)
                            @if($value->product_type == 1)
                                @foreach($feedback['product'] as $valueP)
                                    @if($value->product_id == $valueP->id)
                                    <tr>
                                        <td style="width:40%">
                                            <div style="padding-right:10px">
                                                <a href="{{route('client.product.detail', ['id' => $valueP->slug])}}">
                                                    <img src="{{asset( 'storage/' . $valueP->image)}}" alt="S???n ph???m n??y hi???n ch??a c?? ???nh ho???c ???nh b??? l???i hi???n th???!" style="width:100%;max-width:160px">
                                                </a>
                                            </div>
                                        </td>
                                        <td style="width:60%">
                                            <div>
                                                <a href="{{route('client.product.detail', ['id' => $valueP->slug])}}">
                                                    <span>{{$valueP->name}}</span>
                                                </a>
                                            </div>
                                            <div><span>{{number_format($valueP->price)}} VND</span></div>
                                            <div><span>S??? l?????ng: {{$value->quantity}}</span></div>
                                        </td>
                                    </tr>
                                    @endif
                                @endforeach
                            @else
                                @foreach($feedback['accessory'] as $valueP)
                                    @if($value->product_id == $valueP->id)
                                    <tr>
                                        <td style="width:40%">
                                            <div style="padding-right:10px">
                                                <a href="{{route('client.accessory.detail', ['id' => $valueP->slug])}}">
                                                    <img src="{{asset( 'storage/' . $valueP->image)}}" alt="S???n ph???m n??y hi???n ch??a c?? ???nh ho???c ???nh b??? l???i hi???n th???!" style="width:100%;max-width:160px">
                                                </a>
                                            </div>
                                        </td>
                                        <td style="width:60%">
                                            <div>
                                                <a href="{{route('client.accessory.detail', ['id' => $valueP->slug])}}">
                                                    <span>{{$valueP->name}}</span>
                                                </a>
                                            </div>
                                            <div><span>{{number_format($valueP->price)}} VND</span></div>
                                            <div><span>S??? l?????ng: {{$value->quantity}}</span></div>
                                        </td>
                                    </tr>
                                    @endif
                                @endforeach
                            @endif
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="totail">
                <table cellpadding="0" cellspacing="0">
                    <tbody>
                        <tr>
                            <td valign="top" style="width:49%">T???m t??nh:</td>
                            <td align="right" valign="top">{{$feedback['total']}} VND</td>
                        </tr>
                        <tr>
                            <td valign="top">Thu???:</td>
                            <td align="right" valign="top">{{$feedback['tax']}} VND</td>
                        </tr>
                        <tr>
                            <td valign="top" class="bold">Th??nh ti???n:</td>
                            <td align="right" valign="top" class="bold text-red" style="color: #F62217;">
                                {{$feedback['grand_total']}} VND
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="delivery_status">
                <table cellpadding="0" cellspacing="0">
                    <tbody>
                        <tr>
                            <td valign="top">H??nh th???c thanh to??n:</td>
                            <td align="right" valign="top">Thanh to??n khi nh???n h??ng</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="footer">
            <a href="mailto:lolipetvn@gmail.com" target="_blank">lolipetvn@gmail.com</a>
        </div>
    </div>
</body>

</html>