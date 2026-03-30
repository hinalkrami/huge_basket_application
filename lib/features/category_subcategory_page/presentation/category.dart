import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../values/export.dart';
import '../data/model/category_model.dart';

@RoutePage()
class CategoryPage extends StatefulWidget {
  CategoryPage({super.key, required this.categoryIndex});
  ValueNotifier<int> categoryIndex;
  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return customContainer(
      Column(
        crossAxisAlignment: .start,
        children: [
          Text('Choose your Category', style: AppTextStyle.categoryStyle),
          ValueListenableBuilder(
            valueListenable: widget.categoryIndex,
            builder: (context, value, child) {
              return SizedBox(
                height: 1.sh * 0.15,
                child: ListView.builder(
                  scrollDirection: .horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            widget.categoryIndex.value = index;
                          },
                          child: Container(
                            height: 1.sh * 0.10,
                            width: 1.sw * 0.15,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              shape: .circle,
                              image: DecorationImage(
                                fit: .contain,
                                image: AssetImage(categories[index].categoryImage),
                              ),
                              border: Border.all(
                                color: widget.categoryIndex.value == index
                                    ? AppColors.primaryColor
                                    : Colors.transparent,
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0X4044B12C),
                                  offset: Offset(0, 0),
                                  blurRadius: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          categories[index].categoryName,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: 'MyriadPro',
                            fontWeight: .w600,
                            color: widget.categoryIndex.value == index
                                ? AppColors.primaryColor
                                : AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget customContainer(Widget child) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        color: AppColors.tabBarColor,
        boxShadow: [
          BoxShadow(color: AppColors.boxShadowColor, offset: Offset(0, 3), blurRadius: 10.r),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: child,
    );
  }
}
