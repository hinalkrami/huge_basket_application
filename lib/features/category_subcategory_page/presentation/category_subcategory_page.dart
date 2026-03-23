import 'package:flutter/material.dart';
import 'package:new_app/core/constant/app_constant.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/features/category_subcategory_page/presentation/sub_category.dart';
import 'package:new_app/widget/custom_app_bar.dart';
import 'package:new_app/widget/custom_bedge.dart';
import '../../../values/export.dart';
import '../data/model/category_model.dart';
import 'category.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  ValueNotifier<int> categoryIndex = ValueNotifier(0);

  @override
  void dispose() {
    categoryIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String storeImage = arg['storeImage'];
    String add = arg['add'];
    String shopName = arg['shopName'];
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: CustomAppBar(
        elevation: null,
        appBarColor: Colors.transparent,
        leadingColor: AppColors.white,
        foregroundColor: AppColors.white,
        wantLeading: true,
        title: shopName,
        action: [
          ValueListenableBuilder(
            valueListenable: shoppingCartCount,
            builder: (context, value, child) {
              return CustomBadge(icon: Icons.shopping_cart, color: Colors.white, count: shoppingCartCount.value);
            },
          ),
        ],
      ),
      body: Column(
        spacing: 5.h,
        children: [
          Container(
            height: 1.sh * 0.38,
            padding: EdgeInsets.fromLTRB(20.w, 80.h, 20.w, 5.h),
            decoration: BoxDecoration(
              color: Colors.black,
              backgroundBlendMode: .darken,
              image: DecorationImage(fit: .fill, opacity: 0.8, image: AssetImage(storeImage)),
            ),
            child: Column(
              spacing: 15.h,
              children: [
                CircleAvatar(backgroundImage: AssetImage(storeImage), radius: 40),
                Text(
                  add,
                  style: TextStyle(color: AppColors.white, fontWeight: .bold),
                ),
                SearchBar(
                  hintText: AppText.walmartSearchText,
                  backgroundColor: WidgetStateColor.resolveWith((states) {
                    return AppColors.white;
                  }),
                  hintStyle: WidgetStateTextStyle.resolveWith((states) {
                    return TextStyle(color: AppColors.searchInsideColor);
                  }),
                  leading: Icon(Icons.search_rounded, color: AppColors.searchInsideColor),
                ).wrapPadding(padding: EdgeInsets.symmetric(horizontal: 10.w)),
              ],
            ),
          ),
          // Categories
          CategoryPart(categoryIndex: categoryIndex),
          //subCategory
          SubCategoryPart(categoryIndex: categoryIndex, categories: categories),
        ],
      ),
    );
  }
}
