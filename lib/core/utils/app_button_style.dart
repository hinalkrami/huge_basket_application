import 'package:flutter/material.dart';
import '../../values/export.dart';
import 'app_text_style.dart';

class AppButtonStyle {
  AppButtonStyle({this.wantChangeSize = false});
  bool wantChangeSize;

  ButtonStyle get buttonStyle => ElevatedButton.styleFrom(
    backgroundColor: Color(0XFF44B12C),
    foregroundColor: Colors.white,
    textStyle: AppTextStyle.buttonText,
    fixedSize: wantChangeSize ? Size(1.sw, 1.sh * 0.07) : null,
  );
}
