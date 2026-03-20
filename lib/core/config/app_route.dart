import 'package:flutter/cupertino.dart';
import 'package:new_app/features/auth/presentation/varification_page.dart';
import 'package:new_app/features/home/presentation/home_page.dart';
import 'package:new_app/features/shop_details_page/presentation/shop_details_page.dart';
import 'package:new_app/features/store_page/presentation/store_page.dart';

import '../../features/auth/presentation/login_page.dart';
import '../../features/user_details_page/presentation/user_details_page.dart';
import '../../features/walk_through/presentation/walk_through_page.dart';

class AppRoute {
  static String walkThroughPage = '/';
  static String loginPage = '/login';
  static String varification = '/varification';
  static String detailsPage = '/details';
  static String homePage = '/home';
  static String shopDetails = '/shopDetails';
  static String storePage = '/store';
  static Map<String, WidgetBuilder> route = {
    walkThroughPage: (context) => WalkThroughPage(),
    loginPage: (context) => LoginPage(),
    varification: (context) => VarificationPage(),
    detailsPage: (context) => DetailsPage(),
    homePage: (context) => HomePage(),
    shopDetails: (context) => ShopDetailsPage(),
    storePage: (context) => StorePage(),
  };
}
