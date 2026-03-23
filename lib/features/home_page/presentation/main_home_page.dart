import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/features/home_page/data/model/navigation_model.dart';

import '../../../core/constant/app_constant.dart';
import '../../../widget/custom_app_bar.dart';
import '../../../widget/custom_bedge.dart';
import '../../../widget/custom_navigation_bar.dart';
import '../../category_subcategory_page/data/model/category_model.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

List<String> pageName = ['wjsdn', 'sdn s', 'wjhebd'];

class _MainHomePageState extends State<MainHomePage> {
  ValueNotifier<int> currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentIndex,
      builder: (context, value, child) {
        return Scaffold(
          extendBody: true,
          appBar: CustomAppBar(
            title: navigationItems[currentIndex.value].pageTitle,
            toolBarHeight: 65,
            wantLeading: true,
            leadingButton: currentIndex.value == 0
                ? Center(
                    child: CustomBadge(icon: Icons.notifications, color: Colors.black, count: 2),
                  )
                : null,
            action: [
              ?currentIndex.value == 0
                  ? ValueListenableBuilder(
                      valueListenable: shoppingCartCount,
                      builder: (context, value, child) {
                        return CustomBadge(icon: Icons.shopping_cart, color: Colors.black, count: shoppingCartCount.value);
                      },
                    )
                  : null,
              ?currentIndex.value == 2 ? Icon(Icons.edit_sharp, color: Colors.black) : null,
            ],
          ),
          body: navigationItems.elementAt(currentIndex.value).page,
          bottomNavigationBar: CustomNavigationBar(navigationItems: navigationItems, currentIndex: currentIndex),
        );
      },
    );
  }
}
