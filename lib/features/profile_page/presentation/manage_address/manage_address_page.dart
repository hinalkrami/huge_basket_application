import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:new_app/core/config/app_route.dart';
import 'package:new_app/core/constant/app_constant.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/widget/custom_app_bar.dart';

import '../../../../generated/l10n.dart';
import '../../../../values/export.dart';

class ManageAddressPage extends StatefulWidget {
  const ManageAddressPage({super.key});

  @override
  State<ManageAddressPage> createState() => _ManageAddressPageState();
}

class _ManageAddressPageState extends State<ManageAddressPage> {
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final Box addressBox = Hive.box('addressBox');
    final String address = addressBox.get(S.of(context).address);
    final String unitNumber = addressBox.get(S.of(context).enterUnitNumber);
    final String city = addressBox.get(S.of(context).city);
    final String state = addressBox.get(S.of(context).state);
    final String zipCode = addressBox.get(S.of(context).zipcode);
    final String deliveryInstruction = addressBox.get(S.of(context).deliveryInstruction);
    return Scaffold(
      appBar: CustomAppBar(wantLeading: true, title: AppText.manageAddress),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(offset: Offset(0, 2), blurRadius: 10.r, color: AppColor.grey.withAlpha(80))],
              ),
              child: Column(children: []),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, AppRoute.addNewAddress);
              },
              label: Text(s.addNew),
              icon: Icon(Icons.add_circle_outline, weight: 50, size: 25),
              style: TextButton.styleFrom(foregroundColor: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
