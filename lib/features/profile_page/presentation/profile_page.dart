import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/features/profile_page/data/model/profile_data_model.dart';

import '../../../values/export.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<ProfileDataModel> data = [
    ProfileDataModel(icon: Icons.location_on_outlined, title: 'Manage Address'),
    ProfileDataModel(icon: Icons.chat_bubble_outline_rounded, title: 'Recent Chat'),
    ProfileDataModel(icon: Icons.notifications_none_rounded, title: 'Notification'),
    ProfileDataModel(icon: Icons.star_border_rounded, title: 'Rate the App'),
    ProfileDataModel(icon: Icons.share_outlined, title: 'Share App'),
    ProfileDataModel(icon: Icons.help_outline, title: 'Help & FAQ'),
    ProfileDataModel(icon: Icons.person, title: 'About Us'),
    ProfileDataModel(icon: Icons.note_outlined, title: 'Terms and conditions'),
    ProfileDataModel(icon: Icons.privacy_tip_outlined, title: 'Privacy Policy'),
    ProfileDataModel(icon: Icons.contact_page_outlined, title: 'Contact Us'),
    ProfileDataModel(icon: Icons.logout, title: 'Logout'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.1),
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
            boxShadow: [BoxShadow(color: AppColor.grey.withAlpha(30), blurRadius: 10.r)],
          ),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 20.h,
            children: [
              Icon(data[index].icon, color: AppColors.primaryColor, size: 50.sp),
              Text(data[index].title, style: AppTextStyle.boldWord),
            ],
          ),
        ).wrapPaddingAll(10),
      ),
    );
  }
}
