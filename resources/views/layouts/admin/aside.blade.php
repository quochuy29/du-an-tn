<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="{{route('client.home')}}" class="brand-link">
        <img src="{{ asset('client-theme/images/logo.png')}}" alt="LoliPetVN Logo"
            class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-success">Wibu Pet</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                @if(Auth::check())
                <img src="{{asset( 'storage/' . Auth::user()->avatar)}}" class="img-circle elevation-2" alt="User Image"
                    width="70" />
                @else
                <img src="{{ asset('admin-theme/dist/img/user2-160x160.jpg')}}" class="img-circle elevation-2"
                    alt="User Image">
                @endif
            </div>
            <div class="info">
                @if(Auth::check())
                <a href="{{route('user.profile', ['id' => Auth::user()->id])}}"
                    class="d-block">{{Auth::user()->name}}</a>
                @else
                <a href="">Chua dang nhap</a>
                @endif
            </div>
        </div>

        <!-- SidebarSearch Form -->
        <!-- <div class="form-inline">
            <div class="input-group" data-widget="sidebar-search">
            <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
            <div class="input-group-append">
                <button class="btn btn-sidebar">
                <i class="fas fa-search fa-fw"></i>
                </button>
            </div>
            </div>
        </div> -->
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item">
                    <a href="{{route('dashboard.index')}}" class="nav-link">
                        <i class="fa fa-home"></i>
                        <p>
                            Trang ch???
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="far fa-money-bill-alt"></i>
                        <p>
                            Th???ng k??
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="right fas fa-angle-left"></i>
                                <p>B??nh lu???n</p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="{{route('statistical.commentSum')}}" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>T???ng b??nh lu???n</p>
                                    </a>
                                </li>
                                @foreach($cateType as $cate)
                                <li class="nav-item">
                                    <a href="{{route('statistical.cmtPet',['slug' => $cate->slug])}}" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Th???ng k?? {{$cate->name}}</p>
                                    </a>
                                </li>
                                @endforeach
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('statistical.orderSum')}}" class="nav-link">
                                <i class="right fas fa-angle-left"></i>
                                <p>????n h??ng</p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="{{route('statistical.orderSum')}}" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>T???ng ????n h??ng</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="{{route('statistical.orderCancel')}}" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>T???ng ????n h??ng b??? h???y</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="{{route('statistical.compare')}}" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>So s??nh th??? lo???i</p>
                                    </a>
                                </li>
                                @foreach($cateType as $cate)
                                <li class="nav-item">
                                    <a href="{{route('statistical.compareCate',['slug' => $cate->slug])}}"
                                        class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>So s??nh {{$cate->name}}</p>
                                    </a>
                                </li>
                                @endforeach
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('statistical.revenueSum')}}" class="nav-link">
                                <i class="right fas fa-angle-left"></i>
                                <p>Doanh thu</p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="{{route('statistical.revenueSum')}}" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>T???ng doanh thu</p>
                                    </a>
                                </li>
                                @foreach($cateType as $cate)
                                <li class="nav-item">
                                    <a href="{{route('statistical.revenue',['slug' => $cate->slug])}}" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Doanh thu {{$cate->name}}</p>
                                    </a>
                                </li>
                                @endforeach
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-shopping-cart"></i>
                        <p>
                            ????n h??ng
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{route('order.index')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>T???t c??? ????n h??ng</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-paw"></i>
                        <p>
                            S???n ph???m
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{route('product.index')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>S???n ph???m th?? c??ng</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('accessory.index')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>S???n ph???m ph??? ki???n</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('list.review.index')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>????nh gi?? s???n ph???m</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('product.backup')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>S???n ph???m b??? x??a</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-swatchbook"></i>
                        <p>
                            Phi???u gi???m gi??
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{route('coupon.index')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Danh s??ch</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('coupon.backup')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Gi???m gi?? b??? x??a</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-percent"></i>
                        <p>
                            Lo???i phi???u gi???m gi??
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{route('couponType.index')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Danh s??ch</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('couponType.backup')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>phi???u gi???m gi?? b??? x??a</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-swatchbook"></i>
                        <p>
                            Lo???i gi???m gi??
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{route('discountType.index')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Danh s??ch</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('discountType.backup')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Lo???i gi???m gi?? b??? x??a</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-seedling"></i>
                        <p>
                            Tu???i
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{route('age.index')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Danh s??ch</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('age.backup')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Tu???i b??? x??a</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-cat"></i>
                        <p>
                            Danh m???c
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{route('category.add')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Th??m danh m???c</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('category.index')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Danh s??ch</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('breed.index')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Gi???ng lo??i
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="{{route('breed.index')}}" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Danh s??ch</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="{{route('breed.backup')}}" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Gi???ng lo??i b??? x??a</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('category.backup')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Danh m???c b??? x??a</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fab fa-quinscape"></i>
                        <p>
                            Lo???i danh m???c
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{route('categoryType.index')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Danh s??ch</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('categoryType.add')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Th??m lo???i danh m???c</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('categoryType.backup')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Lo???i danh m???c b??? x??a</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-user-friends"></i>
                        <p>
                            T??i kho???n
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{route('user.index')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Danh s??ch</p>
                            </a>
                        </li>
                        @hasanyrole('Admin|Manage')
                        <li class="nav-item">
                            <a href="{{route('user.add')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Th??m t??i kho???n</p>
                            </a>
                        </li>
                        @endhasanyrole
                        <li class="nav-item">
                            <a href="{{route('user.backup')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>T??i kho???n b??? x??a</p>
                            </a>
                        </li>
                    </ul>
                </li>
                @hasanyrole('Admin')
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-project-diagram"></i>
                        <p>
                            Ph??n quy???n
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{route('role.index')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Danh s??ch</p>
                            </a>
                        </li>
                    </ul>
                </li>
                @endhasanyrole
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-transgender-alt"></i>
                        <p>
                            Gi???i t??nh
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{route('gender.index')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Danh s??ch</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('gender.add')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Th??m gi???i t??nh</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('gender.backup')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Gi???i t??nh b??? x??a</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="far fa-newspaper"></i>
                        <p>
                            B??i vi???t
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{route('blog.index')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Danh s??ch</p>
                            </a>
                        </li>
                        @hasanyrole('Admin|Manage')
                        <li class="nav-item">
                            <a href="{{route('blog.add')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Th??m b??i vi???t</p>
                            </a>
                        </li>
                        @endhasanyrole
                        <li class="nav-item">
                            <a href="{{route('blogCategory.index')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Danh m???c b??i vi???t</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('blogCategory.backup')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Th??ng r??c danh m???c</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('blog.backup')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>B??i vi???t b??? x??a</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-cogs"></i>
                        <p>
                            H??? th???ng
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{route('general.index')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Th??ng tin chung</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('slide.index')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Slide</p>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>