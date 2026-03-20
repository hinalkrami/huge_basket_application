import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/core/config/app_route.dart';
import 'package:new_app/core/constant/app_constant.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/widget/custom_app_bar.dart';
import 'package:new_app/widget/custom_button.dart';
import 'package:new_app/widget/custom_text_field.dart';
import 'package:countrify/countrify.dart';

import '../../../values/export.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   phoneController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
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
                    CustomTextField(controller: phoneController, hint: AppText.phoneHintText, isPhoneNumber: true),
                    CustomButton(
                      onPressed: () {
                        print(phoneController.text);
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, AppRoute.varification, arguments: {'phoneNumber': phoneController.text});
                        }
                      },
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
