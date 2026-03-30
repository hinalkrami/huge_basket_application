import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:new_app/features/profile_page/data/manage_address_data_model/address_model.dart';

import '../../../../core/utils/app_validator.dart';
import '../../../../generated/l10n.dart';
import '../../../../values/export.dart';
import '../../../../widget/custom_app_bar.dart';
import '../../../../widget/custom_button.dart';
import '../../../../widget/custom_text_field.dart';
import '../../../local/hive_box.dart';

@RoutePage()
class EditAddressPage extends StatefulWidget {
  EditAddressPage({super.key, required this.index, required this.address});
  AddressModel? address;
  int? index;
  @override
  State<EditAddressPage> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddressPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _address = TextEditingController(text: widget.address!.location);
  late final TextEditingController _unitNumber = TextEditingController(
    text: widget.address!.unitNumber,
  );
  late final TextEditingController _city = TextEditingController(text: widget.address!.city);
  late final TextEditingController _state = TextEditingController(text: widget.address!.state);
  late final TextEditingController _zipCode = TextEditingController(text: widget.address!.zipCode);
  late final TextEditingController _deliveryInstruction = TextEditingController(
    text: widget.address!.deliveryInstruction,
  );
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
      appBar: CustomAppBar(title: S.of(context).editAddress, wantLeading: true),
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
                    AddressModel editedAddress = AddressModel(
                      location: _address.text,
                      unitNumber: _unitNumber.text,
                      city: _city.text,
                      state: _state.text,
                      zipCode: _zipCode.text,
                      deliveryInstruction: _deliveryInstruction.text,
                    );
                    HiveBox().updateAddressDetails(widget.index!, editedAddress);
                    context.router.back();
                  }
                },
                buttonSize: true,
                child: Text(S.of(context).update),
              ).wrapPaddingTop(70.h),
            ],
          ),
        ),
      ).wrapPaddingAll(20),
    );
  }
}
