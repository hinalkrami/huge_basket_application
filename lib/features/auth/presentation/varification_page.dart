import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:new_app/core/config/app_route.dart';
import 'package:new_app/core/constant/app_constant.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/features/local/hive_box.dart';
import 'package:new_app/widget/custom_app_bar.dart';
import 'package:new_app/widget/custom_button.dart';
import 'package:pinput/pinput.dart';
import '../../../values/export.dart';
import '../data/model/user_details_model.dart';

@RoutePage()
class VarificationPage extends StatefulWidget {
  VarificationPage({super.key, required this.phoneNumber, required this.countryName});
  String phoneNumber;
  String countryName;

  @override
  State<VarificationPage> createState() => _VarificationPageState();
}

class _VarificationPageState extends State<VarificationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController otpController;
  HiveBox box = HiveBox();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    otpController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    otpController.dispose();
    super.dispose();
  }

  void _onPressed() {
    if (otpController.length == 4) {
      box.addUser(widget.phoneNumber, widget.countryName, true);
      context.pushRoute(DetailsRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
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
                Text(
                  AppText.varificationText,
                  textAlign: .center,
                  style: AppTextStyle.varificationTextStyle,
                ),
                Pinput(
                  pinputAutovalidateMode: .onSubmit,
                  controller: otpController,
                  cursor: VerticalDivider(
                    color: AppColors.primaryColor,
                    radius: BorderRadius.circular(10),
                    thickness: 2,
                    indent: 30,
                    endIndent: 30,
                  ),
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
                CustomButton(onPressed: _onPressed, buttonSize: true, child: Text(AppText.varify)),
                TextButton(
                  onPressed: () {},
                  child: Text(AppText.resend, style: AppTextStyle.resendStyle),
                ),
                Image.asset(
                  width: 1.sw * 0.65,
                  AppImage.loginPageImage,
                  opacity: AlwaysStoppedAnimation(0.4),
                  colorBlendMode: .overlay,
                  color: Color(0X10FFFFFF),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
