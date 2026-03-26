import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:new_app/features/profile_page/data/manage_address_data_model/address_model.dart';
import 'package:new_app/values/export.dart';
import 'package:new_app/widget/custom_app_bar.dart';
import 'package:new_app/widget/custom_button.dart';
import 'package:new_app/widget/custom_text_field.dart';

import '../../../../generated/l10n.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  late Box addAddressBox;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _address = TextEditingController();
  late final TextEditingController _unitNumber = TextEditingController();
  late final TextEditingController _city = TextEditingController();
  late final TextEditingController _state = TextEditingController();
  late final TextEditingController _zipCode = TextEditingController();
  late final TextEditingController _deliveryInstruction = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    addAddressBox = Hive.box('addressBox');
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
              CustomTextField(controller: _address, hint: S.of(context).address, keyBoardType: .text, suffixIcon: Icons.location_on),
              CustomTextField(controller: _unitNumber, hint: S.of(context).enterUnitNumber, keyBoardType: .number),
              CustomTextField(controller: _city, hint: S.of(context).city, keyBoardType: .name),
              CustomTextField(controller: _state, hint: S.of(context).state, keyBoardType: .name),
              CustomTextField(controller: _zipCode, hint: S.of(context).zipcode, keyBoardType: .number),
              CustomTextField(controller: _deliveryInstruction, hint: S.of(context).deliveryInstruction, maxLine: 5, keyBoardType: .text),

              CustomButton(
                onPressed: () {
                  _formKey.currentState!.validate();
                  addAddressBox.add(
                    AddressModel(location: _address.text, unitNumber: _unitNumber.text, city: _city.text, state: _state.text, zipCode: _zipCode.text, deliveryInstruction: _deliveryInstruction.text),
                  );
                  // addAddressBox.put(S.of(context).address, _address.text);
                  // addAddressBox.put(S.of(context).enterUnitNumber, _unitNumber.text);
                  // addAddressBox.put(S.of(context).city, _city.text);
                  // addAddressBox.put(S.of(context).state, _state.text);
                  // addAddressBox.put(S.of(context).zipcode, _zipCode.text);
                  // addAddressBox.put(S.of(context).deliveryInstruction, _deliveryInstruction.text);
                  Navigator.pop(context);
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
