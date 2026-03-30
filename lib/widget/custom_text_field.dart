import 'package:countrify/countrify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/core/utils/app_validator.dart';
import '../core/utils/app_colors.dart';
import '../values/export.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.isPhoneNumber = false,
    required this.hint,
    this.keyBoardType,
    this.controller,
    this.suffixIcon,
    this.maxLine = 1,
    this.validator,
    this.inputFormator,
    this.onCountryChanged,
    this.initialCountryCode = CountryCodeEnum.us,
  });
  bool isPhoneNumber;
  String? hint;
  TextStyle? hintStyle;
  TextInputType? keyBoardType;
  TextEditingController? controller;
  int? maxLine;
  IconData? suffixIcon;
  void Function(Country)? onCountryChanged;

  String? Function(String?)? validator;
  List<TextInputFormatter>? inputFormator;
  CountryCodeEnum? initialCountryCode;
  void Function(String, Country)? onPhoneNumberChanged;
  late AppValidator customValidator = AppValidator(hint: hint);
  @override
  Widget build(BuildContext context) {
    return isPhoneNumber
        ? PhoneNumberField(
            pickerType: .fullScreen,
            initialCountryCode: initialCountryCode,
            showFlag: false,
            controller: controller,
            onCountryChanged: onCountryChanged,
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
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              FilteringTextInputFormatter.allow(customValidator.phoneNumber),
              LengthLimitingTextInputFormatter(10),
            ],
            validator: customValidator.phoneNumberValidation,
          )
        : TextFormField(
            controller: controller,
            keyboardType: keyBoardType,
            textInputAction: .next,
            textCapitalization: .words,
            cursorColor: AppColors.primaryColor,
            autovalidateMode: .onUnfocus,
            maxLines: maxLine,
            validator:
                validator ??
                (keyBoardType == .name || keyBoardType == .text
                    ? customValidator.basicValidation
                    : keyBoardType == .emailAddress
                    ? customValidator.emailValidation
                    : keyBoardType == .number
                    ? customValidator.zipCodeValidation
                    : null),
            inputFormatters:
                inputFormator ??
                (keyBoardType == .name
                    ? customValidator.nameFormatter
                    : keyBoardType == .number
                    ? customValidator.zipCode
                    : null),
            decoration: InputDecoration(
              suffixIcon: Icon(suffixIcon, color: AppColor.grey.withAlpha(120)),
              filled: true,
              fillColor: AppColors.filledColor,
              hintText: hint,
              hintStyle: AppTextStyle.hintStyle,
              contentPadding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 10.h),
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
