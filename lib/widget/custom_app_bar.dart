import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/values/colors.dart';

import '../core/utils/app_colors.dart';
import '../values/export.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    this.leadingButton,
    this.action,
    this.wantLeading = false,
    this.appBarColor = AppColors.white,
    this.title = '',
    this.leadingColor = AppColors.black,
    this.toolBarHeight = 56,
    this.foregroundColor,
    this.elevation = 8,
  });
  double? elevation;
  bool wantLeading;
  Color? foregroundColor;
  Color? appBarColor;
  double toolBarHeight;
  Widget? leadingButton;
  Color leadingColor;
  List<Widget>? action;
  String title;
  @override
  late final Size preferredSize = Size.fromHeight(toolBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: title.isEmpty ? Colors.transparent : appBarColor,
      actions: action,
      centerTitle: true,
      surfaceTintColor: appBarColor == AppColors.white ? Colors.white : Colors.transparent,
      shadowColor: elevation != null ? AppColors.shadowColor : null,
      elevation: title.isEmpty ? null : elevation,
      automaticallyImplyLeading: false,
      actionsPadding: EdgeInsets.symmetric(horizontal: 20.w),
      foregroundColor: foregroundColor ?? AppColors.primaryColor,
      leading:
          leadingButton ??
          (wantLeading
              ? IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios_rounded, color: leadingColor),
                )
              : null),
      title: Text(title, style: AppTextStyle.appBarTitle),
    );
  }
}
