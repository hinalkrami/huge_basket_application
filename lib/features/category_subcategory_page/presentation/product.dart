import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/core/config/app_route.dart';
import 'package:new_app/features/product_details_page/presentation/product_details_page.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../values/export.dart';
import '../../product_listing_page/presentation/product_listing_page.dart';
import '../data/model/category_model.dart';
import '../data/model/product_model.dart';

@RoutePage()
class ProductPage extends StatefulWidget {
  ProductPage({
    super.key,
    required this.productList,
    required this.subCategoryIndex,
    required this.subIndex,
    required this.categoryIndex,
  });
  List<Product> productList;
  ValueNotifier<int> subCategoryIndex;
  int subIndex;
  ValueNotifier<int> categoryIndex;

  @override
  State<ProductPage> createState() => _ProductPartState();
}

class _ProductPartState extends State<ProductPage> {
  ValueNotifier<int> currentProduct = ValueNotifier(-1);
  @override
  void dispose() {
    currentProduct.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentProduct,
      builder: (context, value, child) {
        return SizedBox(
          height: 1.sh * 0.3,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            scrollDirection: .horizontal,
            itemCount: (widget.productList.length / 2).round(),
            itemBuilder: (context, proIndex) {
              return Row(
                children: [
                  InkWell(
                    onTap: () => context.pushRoute(
                      ProductDetailsRoute(product: widget.productList[proIndex]),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                      width: 1.sw * 0.5,
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        alignment: AlignmentGeometry.topRight,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                widget.productList[proIndex].productImage,
                                height: 100.h,
                                width: 100.w,
                              ),
                              Row(
                                mainAxisAlignment: .spaceBetween,
                                children: [
                                  Text(
                                    widget.productList[proIndex].productPrice,
                                    style: AppTextStyle.productPrice,
                                  ),
                                  Text(
                                    widget.productList[proIndex].productWeight,
                                    style: AppTextStyle.productWeight,
                                  ),
                                ],
                              ),
                              Text(
                                widget.productList[proIndex].productName,
                                style: AppTextStyle.productNameStyle,
                              ),
                            ],
                          ),
                          ValueListenableBuilder(
                            valueListenable: widget.productList[proIndex].isSelected,
                            builder: (context, value, child) {
                              return InkWell(
                                onTap: () {
                                  widget.productList[proIndex].isSelected.value = true;
                                  if (!cartProduct.contains(widget.productList[proIndex])) {
                                    cartProduct.add(widget.productList[proIndex]);
                                  }
                                  widget.subCategoryIndex.value = widget.subIndex;
                                  currentProduct.value = proIndex;
                                  shoppingCartCount.value = cartProduct.length;
                                },
                                child: cartProduct.contains(widget.productList[proIndex])
                                    ? addToCart(widget.productList[proIndex])
                                    : addToCartIcon(widget.productList[proIndex]),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  ?proIndex == (widget.productList.length / 2).round() - 1
                      ? InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ProductListingPage(
                                  productList: widget.productList,
                                  subcategoryName: categories[widget.categoryIndex.value]
                                      .subcategory[widget.subIndex]
                                      .subCategoryName,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: .circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0X2000001A),
                                  offset: Offset(0, 3),
                                  blurRadius: 16.r,
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.arrow_forward_rounded,
                              size: 30.sp,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        )
                      : null,
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget addToCart(Product product) {
    return ValueListenableBuilder(
      valueListenable: product.cartCount,
      builder: (context, value, child) {
        return Container(
          height: 1.sh * 0.14,
          width: 1.sw * 0.1,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.primaryColor, width: 2),
          ),
          child: Column(
            mainAxisAlignment: .spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  product.cartCount.value++;
                },
                style: IconButton.styleFrom(
                  overlayColor: AppColors.primaryColor,
                  shape: CircleBorder(),
                ),
                iconSize: 18.sp,
                splashRadius: 20.r,
                icon: Icon(Icons.add_rounded, color: AppColors.black, weight: 30),
                visualDensity: VisualDensity(vertical: -4, horizontal: 0),
              ),
              Text(
                '${product.cartCount.value}',
                style: TextStyle(fontSize: 16.sp, fontWeight: .w600),
              ),
              IconButton(
                onPressed: () {
                  if (product.cartCount.value <= 1) {
                    product.isSelected.value = false;
                    product.cartCount.value = 0;
                    if (cartProduct.contains(product)) {
                      cartProduct.remove(product);
                    }
                    shoppingCartCount.value = cartProduct.length;
                  } else {
                    product.cartCount.value--;
                  }
                },
                style: IconButton.styleFrom(
                  overlayColor: AppColors.primaryColor,
                  shape: CircleBorder(),
                  alignment: .center,
                ),
                visualDensity: VisualDensity(vertical: -4),
                icon: product.cartCount.value == 1
                    ? Icon(CupertinoIcons.delete, color: AppColor.red, weight: 30, size: 16.sp)
                    : Icon(Icons.minimize_rounded, weight: 50, size: 18.sp),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget addToCartIcon(Product product) {
    product.cartCount.value = 1;
    return DottedBorder(
      options: CircularDottedBorderOptions(
        color: AppColors.primaryColor,
        strokeWidth: 2,
        dashPattern: [5, 7],
        strokeCap: StrokeCap.round,
      ),
      child: Container(
        decoration: BoxDecoration(color: AppColors.tabBarColor, shape: .circle),
        padding: EdgeInsets.all(2),
        child: Icon(Icons.add, color: AppColors.primaryColor),
      ),
    );
  }
}
