import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app/core/config/app_route.dart';
import 'package:countrify/countrify.dart';
import 'package:new_app/core/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: AppColors.white),
        routes: AppRoute.route,
        locale: const Locale('en'),
        supportedLocales: const [Locale('ar'), Locale('en')],
      ),
    );
  }
}
