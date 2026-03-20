import 'package:flutter/material.dart';
import 'package:new_app/core/config/app_route.dart';
import 'package:new_app/core/constant/app_constant.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/widget/custom_app_bar.dart';
import 'package:new_app/widget/custom_button.dart';
import 'package:pinput/pinput.dart';
import '../../../values/export.dart';

class VarificationPage extends StatefulWidget {
  const VarificationPage({super.key});

  @override
  State<VarificationPage> createState() => _VarificationPageState();
}

class _VarificationPageState extends State<VarificationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String phoneNumber = arg['phoneNumber'];
    print('phoneNumber:$phoneNumber');

    return Scaffold(
      appBar: CustomAppBar(title: AppText.varificationTitle, wantLeading: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.1, vertical: 1.sh * 0.1),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 30,
              children: [
                Text(AppText.varificationText, textAlign: .center, style: AppTextStyle.varificationTextStyle),
                Pinput(
                  pinputAutovalidateMode: .onSubmit,
                  controller: otpController,
                  cursor: VerticalDivider(color: AppColors.primaryColor, radius: BorderRadius.circular(10), thickness: 2, indent: 30, endIndent: 30),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Otp';
                    } else if (value.length < 4) {
                      return 'Fill all field.';
                    }
                    return null;
                  },
                  length: 4,
                  preFilledWidget: Text(AppText.dash, style: AppTextStyle.dashStyle),
                  defaultPinTheme: PinTheme(
                    width: 1.sw * 0.3,
                    height: 1.sh * 0.1,
                    decoration: BoxDecoration(shape: .circle, color: AppColors.otpFieldColor),
                  ),
                ),
                10.verticalSpace,
                CustomButton(
                  onPressed: () {
                    if (otpController.length == 4) {
                      Navigator.pushNamed(context, AppRoute.detailsPage, arguments: {'phoneNumber': phoneNumber});
                    }
                  },
                  buttonSize: true,
                  child: Text(AppText.varify),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(AppText.resend, style: AppTextStyle.resendStyle),
                ),
                Image.asset(width: 1.sw * 0.65, AppImage.loginPageImage, opacity: AlwaysStoppedAnimation(0.4), colorBlendMode: .overlay, color: Color(0X10FFFFFF)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
