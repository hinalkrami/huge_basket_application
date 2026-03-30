import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_app/features/auth/presentation/varification_page.dart';
import 'package:new_app/features/home_page/presentation/main_home_page.dart';
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

@AutoRouterConfig()
class AppRoute extends RootStackRouter {
  // static String walkThroughPage = '/';
  static String loginPage = '/login';
  static String varification = '/varification';
  static String detailsPage = '/details';
  static String homePage = '/home_page';
  static String shopDetails = '/shopDetails';
  static String storePage = '/store';
  static String productListingPage = '/productListing';
  static String productDetailsPage = '/productDetails';
  static String profilePage = '/profilePage';
  static String myOrderPage = '/orders';
  static String manageAddress = '/manageAddress';
  static String addNewAddress = '/addNewAddress';
  static String editAddress = '/editAddress';
  // static Map<String, WidgetBuilder> route = {
  //   walkThroughPage: (context) => WalkThroughPage(),
  //   loginPage: (context) => LoginPage(),
  //   varification: (context) => VarificationPage(),
  //   detailsPage: (context) => DetailsPage(),
  //   homePage: (context) => MainHomePage(),
  //   shopDetails: (context) => ShopDetailsPage(),
  //   storePage: (context) => StorePage(),
  //   // productListingPage:(context)=>ProductListingPage(productList: productList, subcategoryName: subcategoryName),
  //   // productDetailsPage:(context)=>ProductDetailsPage(product: product),
  //   // profilePage: (context) => ProfilePage(),
  //   myOrderPage: (context) => MyOrderPage(),
  //   manageAddress: (context) => ManageAddressPage(),
  //   editAddress: (context) => EditAddress(),
  // };
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: WalkThroughRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: VarificationRoute.page),
    AutoRoute(page: DetailsRoute.page),
    AutoRoute(page: MainHomeRoute.page),
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
