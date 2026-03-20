import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/core/config/app_route.dart';
import 'package:new_app/core/constant/app_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/features/home/data/model/home_page_data_model.dart';
import 'package:new_app/features/shop_details_page/presentation/shop_details_page.dart';
import 'package:new_app/features/store_page/data/model/category_model.dart';
import 'package:new_app/widget/custom_app_bar.dart';
import 'package:new_app/widget/custom_bedge.dart';
import 'package:new_app/widget/custom_list_tile.dart';
import 'package:new_app/widget/custom_navigation_bar.dart';

import '../../../values/export.dart';
import '../data/model/navigation_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<int> currentIndex = ValueNotifier(0);
  List<HomePageDataModel> data = [
    HomePageDataModel(image: AppImage.shop1, title: AppText.homePageTitle1, subTitle1: AppText.homePageSubTitle1, subTitle2: AppText.homePage2SubTitle, trailingText: AppText.homePageTrailing1),
    HomePageDataModel(image: AppImage.shop2, title: AppText.homePageTitle2, subTitle2: AppText.homePage2SubTitle, subTitle1: AppText.homePageSubTitle2, trailingText: AppText.homePageTrailing2),
    HomePageDataModel(image: AppImage.shop3, title: AppText.homePageTitle3, subTitle1: AppText.homePageSubTitle3, subTitle2: AppText.homePage2SubTitle, trailingText: AppText.homePageTrailing3),
    HomePageDataModel(image: AppImage.shop4, title: AppText.homePageTitle4, subTitle1: AppText.homePageSubTitle4, subTitle2: AppText.homePage2SubTitle, trailingText: AppText.homePageTrailing4),
    HomePageDataModel(image: AppImage.shop5, title: AppText.homePageTitle5, subTitle1: AppText.homePageSubTitle5, subTitle2: AppText.homePage2SubTitle, trailingText: AppText.homePageTrailing5),
  ];
  List<NavigationItems> navigationItems = [
    NavigationItems(icon: Icons.store, label: AppText.bottomNavigationLabel1),
    NavigationItems(icon: Icons.shopping_bag, label: AppText.bottomNavigationLabel2),
    NavigationItems(icon: Icons.person, label: AppText.bottomNavigationLabel3),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(
        title: AppText.appTitle,
        toolBarHeight: 65,
        leadingButton: Center(
          child: CustomBadge(icon: Icons.notifications, color: Colors.black, count: 2),
        ),
        action: [
          ValueListenableBuilder(
            valueListenable: shoppingCartCount,
            builder: (context, value, child) {
              return CustomBadge(icon: Icons.shopping_cart, color: Colors.black, count: shoppingCartCount.value);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            alignment: .center,
            color: Color(0XFFF0F6EE),
            child: Text(AppText.nextDeliveryText, style: AppTextStyle.nextDeliveryTextStyle),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => CustomListTile(
                wantBadge: true,
                image: data[index].image,
                title: data[index].title,
                trailingText: data[index].trailingText,
                subTitle: Text(data[index].subTitle1, style: AppTextStyle.homePageSubTitleStyle),
                subTitle2: data[index].subTitle2,
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                onTap: () => Navigator.pushNamed(
                  context,
                  AppRoute.shopDetails,
                  arguments: {'image': data[index].image, 'title': data[index].title, 'trailingText': data[index].trailingText, 'subTitle': data[index].subTitle1, 'subTitle2': data[index].subTitle2},
                ),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (context, value, child) {
          return CustomNavigationBar(navigationItems: navigationItems);
        },
      ),
    );
  }
}
