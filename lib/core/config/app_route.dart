import 'package:flutter/cupertino.dart';
import 'package:new_app/features/auth/presentation/varification_page.dart';
import 'package:new_app/features/home_page/presentation/main_home_page.dart';
import 'package:new_app/features/profile_page/presentation/manage_address/add_address.dart';
import 'package:new_app/features/profile_page/presentation/manage_address/edit_address.dart';
import 'package:new_app/features/profile_page/presentation/manage_address/manage_address_page.dart';
import 'package:new_app/features/my_orders_page/presentation/my_order_page.dart';
import 'package:new_app/features/shop_details_page/presentation/shop_details_page.dart';
import '../../features/auth/presentation/login_page.dart';
import '../../features/category_subcategory_page/presentation/category_subcategory_page.dart';
import '../../features/user_details_page/presentation/user_details_page.dart';
import '../../features/walk_through/presentation/walk_through_page.dart';

class AppRoute {
  static String walkThroughPage = '/';
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
  static Map<String, WidgetBuilder> route = {
    walkThroughPage: (context) => ManageAddressPage(),
    loginPage: (context) => WalkThroughPage(),
    varification: (context) => VarificationPage(),
    detailsPage: (context) => DetailsPage(),
    homePage: (context) => MainHomePage(),
    shopDetails: (context) => ShopDetailsPage(),
    storePage: (context) => StorePage(),
    // productListingPage:(context)=>ProductListingPage(productList: productList, subcategoryName: subcategoryName),
    // productDetailsPage:(context)=>ProductDetailsPage(product: product),
    // profilePage: (context) => ProfilePage(),
    myOrderPage: (context) => MyOrderPage(),
    manageAddress: (context) => LoginPage(),
    addNewAddress: (context) => AddAddress(),
    editAddress: (context) => EditAddress(),
  };
}
