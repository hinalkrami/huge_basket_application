import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ce/hive.dart';
import 'package:new_app/core/config/app_route.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/features/profile_page/data/manage_address_data_model/address_model.dart';
import 'package:new_app/generated/l10n.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = Platform.isAndroid ? await getApplicationDocumentsDirectory() : await getLibraryDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(AddressModelAdapter());
  await Hive.openBox<AddressModel>('addressBox');
  await Hive.openBox('userBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      child: MaterialApp(
        localizationsDelegates: [S.delegate],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: AppColors.white),
        routes: AppRoute.route,
        locale: const Locale('en'),
        supportedLocales: const [Locale('en')],
      ),
    );
  }
}
