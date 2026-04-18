import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_app/features/auth/data/model/user_details_model.dart';
import 'package:new_app/features/auth/presentation/varification_page.dart';
import 'package:new_app/features/home_page/presentation/main_home_page.dart';
import 'package:new_app/features/local/hive_box.dart';
import 'package:new_app/features/profile_page/presentation/manage_address/add_address.dart';
import 'package:new_app/features/profile_page/presentation/manage_address/edit_address.dart';
import 'package:new_app/features/profile_page/presentation/manage_address/manage_address_page.dart';
import 'package:new_app/features/my_orders_page/presentation/my_order_page.dart';
import 'package:new_app/features/shop_details_page/presentation/shop_details_page.dart';
import 'package:collection/collection.dart';
import '../../features/auth/presentation/login_page.dart';
import '../../features/category_subcategory_page/data/model/category_model.dart';
import '../../features/category_subcategory_page/data/model/product_model.dart';
import '../../features/category_subcategory_page/presentation/category.dart';
import '../../features/category_subcategory_page/presentation/category_subcategory_page.dart';
import '../../features/category_subcategory_page/presentation/product.dart';
import '../../features/category_subcategory_page/presentation/sub_category.dart';
import '../../features/home_page/presentation/home_page.dart';
import '../../features/product_details_page/presentation/product_details_page.dart';
import '../../features/product_listing_page/presentation/product_listing_page.dart';
import '../../features/profile_page/data/manage_address_data_model/address_model.dart';
import '../../features/profile_page/presentation/profile_page.dart';
import '../../features/user_details_page/presentation/user_details_page.dart';
import '../../features/walk_through/presentation/walk_through_page.dart';
part 'app_route.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    HiveBox box = HiveBox();
    bool isFirstTime = box.appSetting.get('isFirstTime', defaultValue: true);
    UserDetailsModel? user = box.userBox.get(
      'userNumber',
      defaultValue: UserDetailsModel(isLogin: false),
    );
    if (isFirstTime) {
      router.push(WalkThroughRoute());
    } else if (!user!.isLogin!) {
      router.push(LoginRoute());
    } else {
      resolver.next(true);
    }
  }
}

@AutoRouterConfig()
class AppRoute extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: WalkThroughRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: VarificationRoute.page),
    AutoRoute(page: DetailsRoute.page),
    AutoRoute(page: MainHomeRoute.page, initial: true, guards: [AuthGuard()]),
    AutoRoute(page: ShopDetailsRoute.page),
    AutoRoute(page: StoreRoute.page),
    AutoRoute(page: CategoryRoute.page),
    AutoRoute(page: SubCategoryRoute.page),
    AutoRoute(page: ProductListingRoute.page),
    AutoRoute(page: ProductRoute.page),
    AutoRoute(page: ProductDetailsRoute.page),
    AutoRoute(page: MyOrderRoute.page),
    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: ManageAddressRoute.page),
    AutoRoute(page: AddAddressRoute.page),
    AutoRoute(page: EditAddressRoute.page),
  ];
}
