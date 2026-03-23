import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/features/home_page/presentation/home_page.dart';
import 'package:new_app/features/my_orders_page/presentation/my_order_page.dart';
import 'package:new_app/features/profile_page/presentation/profile_page.dart';

import '../../../../core/constant/app_constant.dart';

class NavigationItems {
  NavigationItems({required this.icon, required this.label, required this.page, required this.pageTitle});
  IconData icon;
  String label;
  Widget page;
  String pageTitle;
}

List<NavigationItems> navigationItems = [
  NavigationItems(icon: Icons.store, label: AppText.bottomNavigationLabel1, page: HomePage(), pageTitle: AppText.appTitle),
  NavigationItems(icon: Icons.shopping_bag, label: AppText.bottomNavigationLabel2, page: MyOrderPage(), pageTitle: AppText.orders),
  NavigationItems(icon: Icons.person, label: AppText.bottomNavigationLabel3, page: ProfilePage(), pageTitle: AppText.profile),
];
