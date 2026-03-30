import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:new_app/core/utils/app_validator.dart';
import 'package:new_app/features/local/hive_box.dart';
import 'package:new_app/features/profile_page/data/manage_address_data_model/address_model.dart';
import 'package:new_app/values/export.dart';
import 'package:new_app/widget/custom_app_bar.dart';
import 'package:new_app/widget/custom_button.dart';
import 'package:new_app/widget/custom_text_field.dart';

import '../../../../generated/l10n.dart';

@RoutePage()
class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddressPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _address;
  late TextEditingController _unitNumber;
  late TextEditingController _city;
  late TextEditingController _state;
  late TextEditingController _zipCode;
  late TextEditingController _deliveryInstruction;
  @override
  void initState() {
    // TODO: implement initState
    _address = TextEditingController();
    _unitNumber = TextEditingController();
    _city = TextEditingController();
    _state = TextEditingController();
    _zipCode = TextEditingController();
    _deliveryInstruction = TextEditingController();
    super.initState();
  }

  List<AddressModel> addresses = [];

  @override
  void dispose() {
    _address.dispose();
    _unitNumber.dispose();
    _city.dispose();
    _state.dispose();
    _zipCode.dispose();
    _deliveryInstruction.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Add New Address', wantLeading: true),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            spacing: 10.h,
            children: [
              CustomTextField(
                controller: _address,
                hint: S.of(context).address,
                keyBoardType: .text,
                suffixIcon: Icons.location_on,
              ),
              CustomTextField(
                controller: _unitNumber,
                hint: S.of(context).enterUnitNumber,
                keyBoardType: .number,
                validator: AppValidator(hint: S.of(context).enterUnitNumber).unitNumberValidation,
                inputFormator: AppValidator().unitNumberCode,
              ),
              CustomTextField(controller: _city, hint: S.of(context).city, keyBoardType: .name),
              CustomTextField(controller: _state, hint: S.of(context).state, keyBoardType: .name),
              CustomTextField(
                controller: _zipCode,
                hint: S.of(context).zipcode,
                keyBoardType: .number,
              ),
              CustomTextField(
                controller: _deliveryInstruction,
                hint: S.of(context).deliveryInstruction,
                maxLine: 5,
                keyBoardType: .text,
              ),
              CustomButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    HiveBox().addAddressDetails(
                      _address.text,
                      _unitNumber.text,
                      _city.text,
                      _state.text,
                      _zipCode.text,
                      _deliveryInstruction.text,
                    );
                    context.router.back();
                  }
                },
                buttonSize: true,
                child: Text(S.of(context).add),
              ).wrapPaddingTop(70.h),
            ],
          ),
        ),
      ).wrapPaddingAll(20),
    );
  }
}
