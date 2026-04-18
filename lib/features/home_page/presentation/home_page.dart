import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:new_app/core/config/app_route.dart';
import 'package:new_app/core/constant/app_constant.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/widget/custom_app_bar.dart';
import 'package:new_app/widget/custom_bedge.dart';
import 'package:new_app/widget/custom_list_tile.dart';
import 'package:new_app/widget/custom_navigation_bar.dart';

import '../../../values/export.dart';
import '../../category_subcategory_page/data/model/category_model.dart';
import '../data/model/home_page_data_model.dart';
import '../data/model/navigation_model.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HomePageDataModel> data = [
    HomePageDataModel(
      image: AppImage.shop1,
      title: AppText.homePageTitle1,
      subTitle1: AppText.homePageSubTitle1,
      subTitle2: AppText.homePage2SubTitle,
      trailingText: AppText.homePageTrailing1,
    ),
    HomePageDataModel(
      image: AppImage.shop2,
      title: AppText.homePageTitle2,
      subTitle2: AppText.homePage2SubTitle,
      subTitle1: AppText.homePageSubTitle2,
      trailingText: AppText.homePageTrailing2,
    ),
    HomePageDataModel(
      image: AppImage.shop3,
      title: AppText.homePageTitle3,
      subTitle1: AppText.homePageSubTitle3,
      subTitle2: AppText.homePage2SubTitle,
      trailingText: AppText.homePageTrailing3,
    ),
    HomePageDataModel(
      image: AppImage.shop4,
      title: AppText.homePageTitle4,
      subTitle1: AppText.homePageSubTitle4,
      subTitle2: AppText.homePage2SubTitle,
      trailingText: AppText.homePageTrailing4,
    ),
    HomePageDataModel(
      image: AppImage.shop5,
      title: AppText.homePageTitle5,
      subTitle1: AppText.homePageSubTitle5,
      subTitle2: AppText.homePage2SubTitle,
      trailingText: AppText.homePageTrailing5,
    ),
  ];
  void _onTap(int index) {
    context.pushRoute(
      ShopDetailsRoute(
        image: data[index].image,
        title: data[index].title,
        subTitle: data[index].subTitle1,
        trailingText: data[index].trailingText,
        subTitle2: data[index].subTitle2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
              onTap: () {
                _onTap(index);
              },
            ),
          ),
        ),
      ],
    );
  }
}
