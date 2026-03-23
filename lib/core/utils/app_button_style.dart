import 'package:flutter/material.dart';
import '../../values/export.dart';
import 'app_text_style.dart';

class AppButtonStyle {
  AppButtonStyle({this.wantChangeSize = false, this.height, this.width, this.customStyle});
  bool wantChangeSize;
  double? width;
  double? height;
  ButtonStyle? customStyle;

  ButtonStyle get buttonStyle =>
      customStyle ??
      ElevatedButton.styleFrom(
        backgroundColor: Color(0XFF44B12C),
        foregroundColor: Colors.white,
        textStyle: AppTextStyle.buttonText,
        fixedSize: wantChangeSize ? Size(width ?? 1.sw, height ?? 1.sh * 0.07) : null,
      );
}
