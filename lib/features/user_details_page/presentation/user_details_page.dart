import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/core/config/app_route.dart';
import 'package:new_app/core/constant/app_constant.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/widget/custom_app_bar.dart';
import 'package:new_app/widget/custom_button.dart';
import 'package:new_app/widget/custom_text_field.dart';

import '../../../values/export.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  ValueNotifier<bool> isChecked = ValueNotifier(false);
  late String phoneNumber;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  late TextEditingController phoneNumberController = TextEditingController(text: phoneNumber);
  TextEditingController zipCodeController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    isChecked.dispose();
    businessNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    zipCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    phoneNumber = arg['phoneNumber'];
    return Scaffold(
      appBar: CustomAppBar(title: AppText.detailsPageTitle, wantLeading: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.1, vertical: 1.sh * 0.05),
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: .onUserInteractionIfError,
            key: _formKey,
            child: Column(
              spacing: 20,
              children: [
                CustomTextField(hint: AppText.businessName, controller: businessNameController, keyBoardType: .name),
                CustomTextField(hint: AppText.firstName, controller: firstNameController, keyBoardType: .name),
                CustomTextField(hint: AppText.lastName, controller: lastNameController, keyBoardType: .name),
                CustomTextField(hint: AppText.emailAdd, controller: emailController, keyBoardType: .emailAddress),
                CustomTextField(isPhoneNumber: true, hint: AppText.phoneHintText, controller: phoneNumberController, keyBoardType: .phone),
                CustomTextField(hint: AppText.zipcode, controller: zipCodeController, keyBoardType: .number),
                20.verticalSpace,
                ValueListenableBuilder(
                  valueListenable: isChecked,
                  builder: (context, value, child) {
                    return CheckboxListTile(
                      controlAffinity: .leading,
                      checkboxScaleFactor: 1,
                      visualDensity: VisualDensity(horizontal: -4),
                      titleAlignment: .center,
                      side: BorderSide(color: AppColors.dividerColor, width: 1.5),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      value: value,
                      checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      activeColor: AppColors.primaryColor,
                      onChanged: (newValue) {
                        isChecked.value = newValue!;
                      },
                      title: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: AppText.agreeText, style: AppTextStyle.agreeTextStyle),
                            TextSpan(text: AppText.termsCondition, style: AppTextStyle.termsConditionStyle),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                20.verticalSpace,
                CustomButton(onPressed: () => _formKey.currentState!.validate() ? Navigator.pushNamed(context, AppRoute.homePage) : () {}, buttonSize: true, child: Text('Add')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
