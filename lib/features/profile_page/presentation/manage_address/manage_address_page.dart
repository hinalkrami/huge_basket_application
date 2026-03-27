import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:new_app/core/config/app_route.dart';
import 'package:new_app/core/constant/app_constant.dart';
import 'package:new_app/core/utils/app_button_style.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/features/local/hive_box.dart';
import 'package:new_app/features/profile_page/data/manage_address_data_model/address_model.dart';
import 'package:new_app/widget/custom_app_bar.dart';

import '../../../../generated/l10n.dart';
import '../../../../values/export.dart';

class ManageAddressPage extends StatefulWidget {
  const ManageAddressPage({super.key});

  @override
  State<ManageAddressPage> createState() => _ManageAddressPageState();
}

class _ManageAddressPageState extends State<ManageAddressPage> {
  HiveBox box = HiveBox();
  late List<AddressModel> listOfAddress;
  late ValueNotifier<AddressModel?>? selectedAddress;
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: CustomAppBar(wantLeading: true, title: AppText.manageAddress),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: box.addressBox.listenable(),
                builder: (context, value, child) {
                  listOfAddress = box.addressBox.values.toList();
                  selectedAddress = ValueNotifier(
                    listOfAddress.isNotEmpty ? listOfAddress.last : null,
                  );
                  return listOfAddress.isEmpty
                      ? Text('No address added.')
                      : Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: listOfAddress.length,
                            itemBuilder: (BuildContext context, int index) {
                              return box.addressBox.isEmpty
                                  ? Text('No any address added.')
                                  : ValueListenableBuilder(
                                      valueListenable: selectedAddress!,
                                      builder: (context, value, child) {
                                        final address = listOfAddress[index];
                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 15.w,
                                            vertical: 10.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10.dm),
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(0, 2),
                                                blurRadius: 10.r,
                                                color: AppColor.grey.withAlpha(80),
                                              ),
                                            ],
                                          ),
                                          child: RadioGroup<AddressModel>(
                                            groupValue: selectedAddress!.value,
                                            onChanged: (selectedValue) {
                                              selectedAddress!.value = selectedValue!;
                                            },
                                            child: Column(
                                              children: [
                                                RadioListTile(
                                                  radioSide: WidgetStateBorderSide.resolveWith((
                                                    states,
                                                  ) {
                                                    if (states.contains(WidgetState.selected)) {
                                                      return BorderSide(
                                                        color: AppColors.primaryColor,
                                                        width: 6.w,
                                                      );
                                                    }
                                                    return BorderSide(
                                                      color: AppColor.grey.withAlpha(90),
                                                      width: 6.w,
                                                    );
                                                  }),
                                                  radioInnerRadius:
                                                      WidgetStateProperty.resolveWith<double>((
                                                        states,
                                                      ) {
                                                        return 2.0.r;
                                                      }),
                                                  activeColor: Colors.white,
                                                  value: address,
                                                  title: Text(
                                                    '${listOfAddress[index].unitNumber}, ${listOfAddress[index].location}, ${listOfAddress[index].city}, ${listOfAddress[index].state}, ${listOfAddress[index].zipCode}',
                                                  ),
                                                ),
                                                Container(
                                                  height: 1.sh * 0.0006,
                                                  width: 1.sw,
                                                  color: AppColor.grey.withAlpha(80),
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: FilledButton.tonalIcon(
                                                        onPressed: () {
                                                          box.addressBox.deleteAt(index);
                                                        },
                                                        style: AppButtonStyle().filledButtonStyle,
                                                        label: Text(S.of(context).delete),
                                                        icon: Icon(
                                                          CupertinoIcons.delete,
                                                          color: AppColor.red,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 1.sh * 0.06,
                                                      width: 1.sw * 0.0015,
                                                      color: AppColor.grey.withAlpha(80),
                                                    ),
                                                    Expanded(
                                                      child: FilledButton.tonalIcon(
                                                        onPressed: () {
                                                          Navigator.pushNamed(
                                                            context,
                                                            AppRoute.editAddress,
                                                            arguments: {
                                                              'selectedAddress':
                                                                  listOfAddress[index],
                                                              'index': index,
                                                            },
                                                          );
                                                        },
                                                        style: AppButtonStyle().filledButtonStyle,
                                                        icon: Icon(
                                                          Icons.edit,
                                                          color: AppColor.grey,
                                                        ),
                                                        label: Text(S.of(context).change),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                            },
                          ),
                        );
                },
              ),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, AppRoute.addNewAddress);
              },
              label: Text(s.addNew),
              icon: Icon(Icons.add_circle_outline, weight: 50, size: 25),
              style: TextButton.styleFrom(foregroundColor: AppColors.primaryColor),
            ).wrapPaddingVertical(10.h),
          ],
        ),
      ),
    );
  }
}
