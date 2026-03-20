import 'package:countrify/countrify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/core/utils/app_text_style.dart';

import '../core/constant/app_constant.dart';
import '../core/utils/app_colors.dart';
import '../values/export.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, this.isPhoneNumber = false, required this.hint, this.keyBoardType, this.controller});
  bool isPhoneNumber;
  String? hint;
  TextStyle? hintStyle;
  TextInputType? keyBoardType;
  TextEditingController? controller;
  RegExp phoneNumber = RegExp(r'^[6,7,8,9][0-9]*');
  RegExp name = RegExp(r'^[a-zA-z ]+');
  RegExp email = RegExp(r'^[a-z0-9]+@[a-z]+\.[a-z]+$');
  late List<TextInputFormatter>? nameFormatter = [FilteringTextInputFormatter.allow(name)];
  late List<TextInputFormatter>? zipCode = [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(6)];
  String? Function(String?)? phoneNumberValidation = (value) {
    if (value!.isEmpty) {
      return '${AppText.phoneHintText} should not be empty.';
    } else if (value.length < 10) {
      return '${AppText.phoneHintText} should be in 10 digits.';
    }
    return null;
  };
  late String? Function(String?)? basicValidation = (value) {
    if (value!.isEmpty) {
      return 'Please Enter $hint.';
    }
    return null;
  };
  late String? Function(String?)? zipCodeValidation = (value) {
    if (value!.isEmpty) {
      return 'Please Enter $hint.';
    } else if (value.length < 6) {
      return 'Length should be of 6 digits.';
    }
    return null;
  };
  late String? Function(String?)? emailValidation = (value) {
    if (value!.isEmpty) {
      return 'Please Enter $hint.';
    } else if (!email.hasMatch(value)) {
      return 'Email should be in \'xyz12@gmail.com\'';
    }
    return null;
  };
  @override
  Widget build(BuildContext context) {
    return isPhoneNumber
        ? PhoneNumberField(
            pickerType: .fullScreen,
            initialCountryCode: CountryCode.us,
            showFlag: false,
            controller: controller,
            style: CountrifyFieldStyle(
              filled: true,
              cursorColor: AppColors.primaryColor,
              fillColor: AppColors.filledColor,
              hintText: hint,
              dividerColor: AppColors.dividerColor,
              hintStyle: AppTextStyle.hintStyle,
              contentPadding: EdgeInsets.symmetric(horizontal: 23.w),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: AppColors.errorBorderColor, width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: AppColors.errorBorderColor, width: 2),
              ),
            ),
            showDropdownIcon: false,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly, FilteringTextInputFormatter.allow(phoneNumber), LengthLimitingTextInputFormatter(10)],
            validator: phoneNumberValidation,
          )
        : TextFormField(
            controller: controller,
            keyboardType: keyBoardType,
            cursorColor: AppColors.primaryColor,
            autovalidateMode: .onUnfocus,
            validator: keyBoardType == .name
                ? basicValidation
                : keyBoardType == .emailAddress
                ? emailValidation
                : keyBoardType == .number
                ? zipCodeValidation
                : null,
            inputFormatters: keyBoardType == .name
                ? nameFormatter
                : keyBoardType == .number
                ? zipCode
                : null,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.filledColor,
              hintText: hint,
              hintStyle: AppTextStyle.hintStyle,
              contentPadding: EdgeInsets.symmetric(horizontal: 23.w),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: AppColors.errorBorderColor, width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: AppColors.errorBorderColor, width: 2),
              ),
            ),
          );
  }
}
