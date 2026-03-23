import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app/core/config/app_route.dart';
import 'package:new_app/core/constant/app_constant.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/values/colors.dart';
import 'package:new_app/widget/custom_app_bar.dart';
import 'package:new_app/widget/custom_bedge.dart';
import 'package:new_app/widget/custom_list_tile.dart';

import '../../../core/utils/app_text_style.dart';
import '../../category_subcategory_page/data/model/category_model.dart';
import '../data/model/review_data.dart';

class ShopDetailsPage extends StatefulWidget {
  const ShopDetailsPage({super.key});
  @override
  State<ShopDetailsPage> createState() => _ShopDetailsPageState();
}

class _ShopDetailsPageState extends State<ShopDetailsPage> {
  ValueNotifier<Color?> buttonTextColor1 = ValueNotifier(AppColors.primaryColor);
  ValueNotifier<Color?> buttonTextColor2 = ValueNotifier(AppColor.grey);
  late ValueNotifier<Widget> body = ValueNotifier(aboutUs());
  List<UserReviews> reviewsData = [
    UserReviews(image: AppImage.profile1, name: AppText.user1),
    UserReviews(image: AppImage.profile2, name: AppText.user2),
    UserReviews(image: AppImage.profile3, name: AppText.user3),
  ];
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    String image = arg['image'];
    String title = arg['title'];
    String subTitle = arg['subTitle'];
    String subTitle2 = arg['subTitle2'];
    String trailingText = arg['trailingText'];
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: CustomAppBar(
        appBarColor: Colors.transparent,
        title: 'Store Details',
        foregroundColor: Colors.white,
        wantLeading: true,
        leadingColor: AppColors.white,
        action: [
          ValueListenableBuilder(
            valueListenable: shoppingCartCount,
            builder: (context, value, child) {
              return CustomBadge(icon: Icons.shopping_cart, color: AppColors.white, count: shoppingCartCount.value);
            },
          ),
        ],
      ),

      body: Stack(
        children: [
          Column(
            children: [
              Image.asset(AppImage.store, fit: .fill),
              50.verticalSpace,
              Row(
                spacing: 5,
                children: [
                  ValueListenableBuilder(
                    valueListenable: buttonTextColor1,
                    builder: (context, value, child) {
                      return Expanded(
                        child: FilledButton(
                          onPressed: () {
                            buttonTextColor1.value = AppColors.primaryColor;
                            buttonTextColor2.value = AppColor.grey;
                            body.value = aboutUs();
                          },
                          style: FilledButton.styleFrom(shape: RoundedRectangleBorder(), backgroundColor: AppColors.tabBarColor, elevation: 0, foregroundColor: buttonTextColor1.value),
                          child: Text('About Us'),
                        ),
                      );
                    },
                  ),
                  ValueListenableBuilder(
                    valueListenable: buttonTextColor2,
                    builder: (context, value, child) {
                      return Expanded(
                        child: FilledButton(
                          onPressed: () {
                            buttonTextColor2.value = AppColors.primaryColor;
                            buttonTextColor1.value = AppColor.grey;
                            body.value = review();
                          },
                          style: FilledButton.styleFrom(shape: RoundedRectangleBorder(), backgroundColor: AppColors.tabBarColor, elevation: 0, foregroundColor: buttonTextColor2.value),
                          child: Text('Reviews'),
                        ),
                      );
                    },
                  ),
                ],
              ),
              ValueListenableBuilder(
                valueListenable: body,
                builder: (context, value, child) {
                  return body.value;
                },
              ),
            ],
          ),
          Positioned(
            top: 180.h,
            left: 10.w,
            right: 10.w,
            child: CustomListTile(
              wantBadge: true,
              image: image,
              title: title,
              trailingText: trailingText,
              subTitle: Text(subTitle, style: AppTextStyle.homePageSubTitleStyle),
              subTitle2: subTitle2,
              onTap: () => Navigator.pushNamed(context, AppRoute.storePage, arguments: {'shopName': title, 'storeImage': image, 'add': subTitle2}),
            ),
          ),
        ],
      ),
    );
  }

  Widget aboutUs() {
    return SizedBox(
      height: 1.sh * 0.5,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Text(AppText.aboutUsBody, style: AppTextStyle.agreeTextStyle),
        ),
      ),
    );
  }

  Widget review() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text('${AppText.allReview} (${reviewsData.length * 2})', style: AppTextStyle.boldWord),
              Text(AppText.viewAll, style: AppTextStyle.boldWord),
            ],
          ),
        ),

        SizedBox(
          height: 1.sh * 0.482,
          child: ListView.separated(
            padding: EdgeInsets.all(0),
            itemBuilder: (BuildContext context, firstIndex) {
              int currentIndex = firstIndex % reviewsData.length;
              return CustomListTile(
                wantDecoration: false,
                image: reviewsData[currentIndex].image,
                title: reviewsData[currentIndex].name,
                trailingText: '2 min ago',
                subTitle: Row(
                  children: List<Widget>.generate(5, (index) {
                    return Icon(
                      Icons.star,
                      color: firstIndex == 0 && index <= 2
                          ? Colors.orangeAccent
                          : firstIndex != 0 && index <= 3
                          ? Colors.orangeAccent
                          : null,
                    );
                  }),
                ),
                subTitle2: 'Lorem Ipsum is simply dummy textLorem Ipsum is sim ply dummy textLorem Ipsum is simply dummy text',
                wantBadge: false,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(color: Colors.grey.shade300);
            },
            itemCount: 6,
          ),
        ),
      ],
    );
  }
}
