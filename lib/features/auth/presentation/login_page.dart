import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:countrify/countrify.dart';
import 'package:flutter/material.dart';
import 'package:new_app/core/config/app_route.dart';
import 'package:new_app/core/constant/app_constant.dart';
import 'package:new_app/features/auth/data/model/user_details_model.dart';
import 'package:new_app/widget/custom_button.dart';
import 'package:new_app/widget/custom_text_field.dart';

import '../../../values/export.dart';
import '../../local/hive_box.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController phoneController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late ValueNotifier<CountryCode> _country;
  HiveBox box = HiveBox();

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
    _country = ValueNotifier(CountryCodeEnum.in_);
  }

  @override
  void dispose() {
    phoneController.dispose();
    _country.dispose();
    super.dispose();
  }

  void _onPressed() {
    if (_formKey.currentState!.validate()) {
      UserDetailsModel? user = box.userBox.get('userNumber');
      if (user != null) {
        {
          if (box.userBox.get('userNumber')!.userNumber == phoneController.text &&
              box.userBox.get('userNumber')!.country == _country.value.name) {
            box.updateLoginNumber(phoneController.text, _country.value.name, true);
            context.router.replaceAll([MainHomeRoute()]);
          } else {
            context.pushRoute(
              VarificationRoute(
                phoneNumber: phoneController.text,
                countryName: _country.value.name,
              ),
            );
          }
        }
      } else {
        context.pushRoute(
          VarificationRoute(phoneNumber: phoneController.text, countryName: _country.value.name),
        );
      }
    }
  }

  void _onCountryChanged(Country country) {
    String code = country.alpha2Code;
    _country.value = CountryCode.values.firstWhere(
      (c) => c.name.toUpperCase() == code,
      orElse: () => CountryCode.in_,
    );
  }

  @override
  Widget build(BuildContext context) {
    log('LoginScreen:isLogin:${box.userBox.get('userNumber')!.isLogin}');
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: .center,
            spacing: 20,
            children: [
              Image.asset(AppImage.loginPageImage),
              Form(
                key: _formKey,
                child: Column(
                  spacing: 20,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: _country,
                      builder: (context, value, child) {
                        return CustomTextField(
                          controller: phoneController,
                          hint: AppText.phoneHintText,
                          isPhoneNumber: true,
                          initialCountryCode: _country.value,
                          onCountryChanged: _onCountryChanged,
                        );
                      },
                    ),
                    CustomButton(
                      onPressed: _onPressed,
                      buttonSize: true,
                      child: Text(AppText.loginButtonText),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
