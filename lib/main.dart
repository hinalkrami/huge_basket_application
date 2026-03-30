import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:new_app/core/config/app_route.dart';
import 'package:new_app/core/constant/app_constant.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/features/auth/data/model/user_details_model.dart';
import 'package:new_app/features/profile_page/data/manage_address_data_model/address_model.dart';
import 'package:new_app/generated/l10n.dart';

void main() async {
  print("Main: Initializing...");
  WidgetsFlutterBinding.ensureInitialized();

  print("Main: Initializing Hive...");
  await Hive.initFlutter();

  print("Main: Registering Adapters...");
  Hive.registerAdapter(AddressModelAdapter());
  Hive.registerAdapter(UserDetailsModelAdapter());

  print("Main: Opening addressBox...");
  await Hive.openBox<AddressModel>(HiveBoxName.addressBox);

  print("Main: Opening userBox...");
  await Hive.openBox<UserDetailsModel>(HiveBoxName.userBox);

  print("Main: Running App...");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRoute();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      child: MaterialApp.router(
        localizationsDelegates: [S.delegate],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: AppColors.white),
        routerConfig: _appRouter.config(),
        locale: const Locale('en'),
        supportedLocales: const [Locale('en')],
      ),
    );
  }
}
