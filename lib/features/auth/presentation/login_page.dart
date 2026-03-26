import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_ce/hive.dart';
import 'package:new_app/core/config/app_route.dart';
import 'package:new_app/core/constant/app_constant.dart';
import 'package:new_app/widget/custom_button.dart';
import 'package:new_app/widget/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../values/export.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final pref;
  late String phoneNumber;
  void checkLogin() async {
    pref = await SharedPreferences.getInstance();
    phoneNumber = await pref.getString('phoneNumber');
    print(pref.getString('phoneNumber'));
  }

  @override
  void initState() {
    // TODO: implement initState
    checkLogin();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    phoneController.dispose();
    super.dispose();
  }

  final userBox = Hive.box('userBox');
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
                        if (_formKey.currentState!.validate()) {
                          if (phoneNumber == phoneController.text) {
                            pref.setBool('isLogin', true);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login SuccessFully')));
                            Navigator.pushNamed(context, AppRoute.varification /*arguments: {'phoneNumber': phoneController.text}*/);
                          }
                        }
                      },
                      buttonSize: true,
                      child: Text(AppText.loginButtonText),
                    ),
                    CustomButton(onPressed: () => Navigator.pushNamed(context, AppRoute.detailsPage), child: Text('register')),
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
