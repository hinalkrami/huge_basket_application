import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_text_style.dart';
import '../values/export.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile({
    super.key,
    required this.image,
    required this.title,
    required this.trailingText,
    required this.subTitle,
    this.subTitle2 = '',
    this.onTap,
    this.padding,
    this.margin,
    this.wantDecoration = true,
    required this.wantBadge,
  });
  String image;
  bool wantBadge;
  String title;
  Widget subTitle;
  String trailingText;
  String subTitle2;
  EdgeInsets? margin;
  EdgeInsets? padding;
  bool wantDecoration;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw * 0.98,
      height: 1.sh * 0.14,
      margin: margin,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: wantDecoration
          ? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 30)],
            )
          : null,
      child: InkWell(
        onTap: onTap,
        child: Row(
          spacing: 10.w,
          crossAxisAlignment: .center,
          children: [
            Column(
              children: [
                Stack(
                  alignment: .bottomCenter,
                  children: [
                    Container(
                      width: 1.sw * 0.2,
                      height: 1.sh * 0.1,
                      decoration: BoxDecoration(
                        shape: .circle,
                        image: DecorationImage(fit: .fill, image: AssetImage(image)),
                      ),
                    ),
                    ?wantBadge
                        ? Container(
                            alignment: .center,
                            width: 1.sw * 0.1,
                            height: 1.sh * 0.02,
                            decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              mainAxisAlignment: .center,
                              mainAxisSize: .min,
                              children: [
                                Icon(Icons.star, color: AppColors.white, size: 13.sp),
                                Text(
                                  '4.5',
                                  style: TextStyle(color: AppColors.white, fontSize: 8.sp),
                                ),
                              ],
                            ),
                          )
                        : null,
                  ],
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(flex: 3, child: Text(title, style: AppTextStyle.homePageTitleStyle)),
                        Expanded(child: Text(trailingText, style: AppTextStyle.homePageTrailingStyle)),
                      ],
                    ),
                  ),
                  subTitle,
                  Expanded(child: Text(subTitle2, style: AppTextStyle.homePageSubTitleStyle)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
