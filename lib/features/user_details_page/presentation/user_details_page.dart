import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:new_app/core/config/app_route.dart';
import 'package:new_app/core/constant/app_constant.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/widget/custom_app_bar.dart';
import 'package:new_app/widget/custom_button.dart';
import 'package:new_app/widget/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../values/export.dart';
import '../../local/hive_box.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final ValueNotifier<bool> isChecked = ValueNotifier(false);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController businessNameController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController zipCodeController;
  @override
  void initState() {
    super.initState();
    businessNameController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    zipCodeController = TextEditingController();
  }

  @override
  void dispose() {
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
                CustomTextField(
                  hint: AppText.businessName,
                  controller: businessNameController,
                  keyBoardType: .name,
                ),
                CustomTextField(
                  hint: AppText.firstName,
                  controller: firstNameController,
                  keyBoardType: .name,
                ),
                CustomTextField(
                  hint: AppText.lastName,
                  controller: lastNameController,
                  keyBoardType: .name,
                ),
                CustomTextField(
                  hint: AppText.emailAdd,
                  controller: emailController,
                  keyBoardType: .emailAddress,
                ),
                CustomTextField(
                  isPhoneNumber: true,
                  hint: AppText.phoneHintText,
                  controller: phoneNumberController,
                  keyBoardType: .phone,
                ),
                CustomTextField(
                  hint: AppText.zipcode,
                  controller: zipCodeController,
                  keyBoardType: .number,
                ),
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
                            TextSpan(
                              text: AppText.termsCondition,
                              style: AppTextStyle.termsConditionStyle,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                20.verticalSpace,
                CustomButton(
                  buttonSize: true,
                  child: Text('Add'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, AppRoute.homePage);
                      // HiveBox().addUserDetails(
                      //   phoneNumberController.text,
                      //   businessNameController.text,
                      //   emailController.text,
                      //   firstNameController.text,
                      //   lastNameController.text,
                      //   zipCodeController.text,
                      // );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
