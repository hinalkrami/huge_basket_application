import 'package:flutter/material.dart';
import '../core/utils/app_colors.dart';
import '../features/home_page/data/model/navigation_model.dart';
import 'custom_bedge.dart';

class CustomNavigationBar extends StatefulWidget {
  CustomNavigationBar({super.key, required this.navigationItems, required this.currentIndex});
  List<NavigationItems> navigationItems = [];
  ValueNotifier<int> currentIndex;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.currentIndex,
      builder: (context, value, child) {
        return NavigationBar(
          indicatorColor: Colors.transparent,
          selectedIndex: widget.currentIndex.value,
          overlayColor: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return Colors.transparent;
            }
            return Colors.transparent;
          }),
          labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return TextStyle(color: AppColors.primaryColor);
            }
            return TextStyle(color: Colors.grey);
          }),
          onDestinationSelected: (index) {
            widget.currentIndex.value = index;
          },
          elevation: 0,
          backgroundColor: AppColors.bottomNavigationColor,
          destinations: List<Widget>.generate(widget.navigationItems.length, (index) {
            return Column(
              children: [
                Expanded(
                  child: NavigationDestination(
                    icon: index == 1
                        ? CustomBadge(count: 2, icon: widget.navigationItems[index].icon, color: index == widget.currentIndex.value ? AppColors.primaryColor : Colors.grey)
                        : Icon(widget.navigationItems[index].icon, color: index == widget.currentIndex.value ? AppColors.primaryColor : Colors.grey),
                    label: widget.navigationItems[index].label,
                  ),
                ),
                ?widget.currentIndex.value == index
                    ? Container(
                        width: 50,
                        height: 6,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                        ),
                      )
                    : null,
              ],
            );
          }),
        );
      },
    );
  }
}
