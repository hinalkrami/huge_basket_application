import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:new_app/core/config/app_route.dart';
import 'package:new_app/features/category_subcategory_page/presentation/product.dart';
import 'package:new_app/features/product_listing_page/presentation/product_listing_page.dart';
import '../../../core/constant/app_constant.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../values/export.dart';
import '../data/model/category_model.dart';
import '../data/model/product_model.dart';
import '../data/model/sub_category_model.dart';

@RoutePage()
class SubCategoryPage extends StatefulWidget {
  SubCategoryPage({super.key, required this.categoryIndex, required this.categories});
  ValueNotifier<int> categoryIndex;
  List<CategoryModel> categories;

  @override
  State<SubCategoryPage> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategoryPage> {
  late ValueNotifier<int> subCategoryIndex;
  SubCategoryModel? subCategoryList;
  @override
  void initState() {
    super.initState();
    subCategoryIndex = ValueNotifier(-1);
  }

  @override
  void dispose() {
    subCategoryIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh * 0.37,
      child: ValueListenableBuilder(
        valueListenable: widget.categoryIndex,
        builder: (context, value, child) {
          return ListView.builder(
            padding: EdgeInsets.all(0),
            itemCount: widget.categories[widget.categoryIndex.value].subcategory.length,
            itemBuilder: (context, subIndex) {
              subCategoryIndex.value = subIndex;
              subCategoryList = widget.categories[widget.categoryIndex.value].subcategory[subIndex];
              List<Product> productList = subCategoryList!.products;
              return customContainer(
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(subCategoryList!.subCategoryName, style: AppTextStyle.categoryStyle),
                        TextButton(
                          onPressed: () => context.pushRoute(
                            ProductListingRoute(
                              productList: productList,
                              subcategoryName: widget
                                  .categories[widget.categoryIndex.value]
                                  .subcategory[subIndex]
                                  .subCategoryName,
                            ),
                          ),
                          child: Row(
                            spacing: 5.w,
                            children: [
                              Text(AppText.more, style: AppTextStyle.lightTextStyle),
                              Icon(Icons.arrow_forward_ios, color: AppColors.black, size: 12.sp),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // productList
                    ProductPage(
                      productList: productList,
                      subCategoryIndex: subCategoryIndex,
                      subIndex: subIndex,
                      categoryIndex: widget.categoryIndex,
                    ),
                  ],
                ),
              );
            },
          );
        },
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
