import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/app_constant.dart';

class AppValidator {
  AppValidator({this.hint});
  String? hint;
  RegExp phoneNumber = RegExp(r'^[6,7,8,9][0-9]*');
  RegExp name = RegExp(r'^[a-zA-z ]+');
  RegExp email = RegExp(r'^[a-z0-9]+@[a-z]+\.[a-z]+$');
  late List<TextInputFormatter>? nameFormatter = [FilteringTextInputFormatter.allow(name)];
  late List<TextInputFormatter>? zipCode = [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(6),
  ];
  late List<TextInputFormatter>? unitNumberCode = [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(6),
  ];
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
      return 'Please enter ${hint?.toLowerCase()}.';
    }
    return null;
  };
  late String? Function(String?)? zipCodeValidation = (value) {
    if (value!.isEmpty) {
      return 'Please enter ${hint?.toLowerCase()}.';
    } else if (value.length < 6) {
      return 'Length should be of 6 digits.';
    }
    return null;
  };
  late String? Function(String?)? emailValidation = (value) {
    if (value!.isEmpty) {
      return 'Please enter ${hint?.toLowerCase()}.';
    } else if (!email.hasMatch(value)) {
      return 'Email should be in \'xyz12@gmail.com\'';
    }
    return null;
  };
  late String? Function(String?)? unitNumberValidation = (value) {
    if (value!.isEmpty) {
      return 'Please enter ${hint?.toLowerCase()}.';
    } else if (value.length < 4) {
      return 'Length should be of 4 or more digits.';
    }
    return null;
  };
}
