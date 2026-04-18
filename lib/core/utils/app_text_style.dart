import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_colors.dart';

import '../../values/export.dart';

class AppTextStyle {
  static String fontFamily = 'MyriadPro';
  static TextStyle hintStyle = TextStyle(
    color: AppColors.hintColor,
    fontSize: 14.sp,
    fontWeight: .w400,
  );
  static TextStyle appBarTitle = TextStyle(
    fontSize: 18.sp,
    fontWeight: .w700,
    fontFamily: fontFamily,
  );
  static TextStyle skip = TextStyle(
    fontSize: 16.sp,
    fontFamily: fontFamily,
    fontWeight: .w700,
    color: AppColors.black,
  );
  static TextStyle termsConditionStyle = TextStyle(
    color: AppColors.primaryColor,
    decoration: .underline,
    fontFamily: fontFamily,
    fontWeight: .w400,
    fontSize: 16.sp,
  );
  static TextStyle agreeTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    color: AppColors.agreeTextColor,
    fontWeight: .w400,
  );
  static TextStyle resendStyle = TextStyle(
    color: Colors.black,
    fontSize: 16.sp,
    fontWeight: .w600,
    fontFamily: fontFamily,
    decoration: .underline,
  );
  static TextStyle varificationTextStyle = TextStyle(fontFamily: fontFamily, fontWeight: .w600);
  static TextStyle pageTitle = TextStyle(
    fontSize: 18.sp,
    fontWeight: .w700,
    fontFamily: fontFamily,
  );
  static TextStyle nextDeliveryTextStyle = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 15.sp,
    fontWeight: .w600,
  );
  static TextStyle homePageTitleStyle = TextStyle(
    fontSize: 15.sp,
    fontWeight: .w600,
    fontFamily: fontFamily,
  );
  static TextStyle homePageSubTitleStyle = TextStyle(
    color: AppColors.homePageSubTitleColor,
    fontSize: 11.sp,
    fontWeight: .w400,
    fontFamily: fontFamily,
  );
  static TextStyle detailsSubTitleStyle = TextStyle(
    color: AppColors.black,
    fontSize: 11.sp,
    fontWeight: .w400,
    fontFamily: fontFamily,
  );
  static TextStyle boldWord = TextStyle(fontWeight: .w700, fontFamily: fontFamily, fontSize: 14.sp);
  static TextStyle categoryStyle = TextStyle(
    fontWeight: .w700,
    fontFamily: fontFamily,
    fontSize: 18.sp,
  );
  static TextStyle lightTextStyle = TextStyle(
    fontSize: 12.sp,
    fontFamily: fontFamily,
    color: AppColors.black,
    fontWeight: .w600,
  );
  static TextStyle homePageTrailingStyle = TextStyle(
    color: AppColors.homePageTrailingColor,
    fontSize: 11.sp,
    fontWeight: .w400,
    fontFamily: fontFamily,
  );
  static TextStyle productNameStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13.sp,
    fontWeight: .w400,
  );
  static TextStyle productPrice = TextStyle(fontWeight: .w700, fontFamily: fontFamily);
  static TextStyle productWeight = TextStyle(fontFamily: fontFamily, fontSize: 14.sp);
  static TextStyle dashStyle = TextStyle(color: AppColors.dividerColor);
  static TextStyle buttonText = TextStyle(fontWeight: .w700);
  static TextStyle pageSubTitle = TextStyle(
    fontSize: 14.sp,
    fontWeight: .w400,
    fontFamily: fontFamily,
    color: Colors.black.withAlpha(150),
  );
  static TextStyle viewAllStyle = TextStyle(
    fontWeight: .w700,
    fontSize: 13.sp,
    fontFamily: fontFamily,
  );
}
