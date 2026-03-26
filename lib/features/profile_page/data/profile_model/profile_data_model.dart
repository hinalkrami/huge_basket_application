import 'package:flutter/material.dart';

class ProfileDataModel {
  ProfileDataModel({required this.icon, required this.title, this.page});
  String title;
  IconData icon;
  Widget? page;
}
