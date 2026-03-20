import 'package:flutter/material.dart';

import '../core/utils/app_button_style.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.onPressed,
    this.child,
    this.buttonSize = false,
  });
  void Function()? onPressed;
  Widget? child;
  bool buttonSize;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: AppButtonStyle(wantChangeSize: buttonSize).buttonStyle,
      child: child,
    );
  }
}
