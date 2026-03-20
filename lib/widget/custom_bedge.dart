import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';
import '../values/export.dart';

class CustomBadge extends StatelessWidget {
  CustomBadge({super.key, required this.icon, this.color, required this.count});
  IconData icon;
  Color? color;
  int count;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: .topRight,
      children: [
        Icon(icon, size: 30, color: color),
        ?count > 0
            ? Container(
                height: 13,
                width: 13,
                alignment: .center,
                decoration: BoxDecoration(
                  shape: .circle,
                  color: AppColors.primaryColor,
                  border: Border.all(color: AppColors.white, style: .solid),
                ),
                child: Text(
                  '$count',
                  style: TextStyle(color: AppColors.white, fontSize: 5.sp, fontWeight: .w700),
                ),
              )
            : null,
      ],
    );
  }
}
