import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/features/store_page/data/model/category_model.dart';
import 'package:new_app/widget/custom_app_bar.dart';
import 'package:new_app/widget/custom_bedge.dart';

import '../../../core/utils/app_text_style.dart';
import '../../../values/export.dart';
import '../../store_page/data/model/product_model.dart';

class ProductListingPage extends StatefulWidget {
  ProductListingPage({super.key, required this.productList, required this.subcategoryName});
  List<Product> productList;
  String subcategoryName;

  @override
  State<ProductListingPage> createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: widget.subcategoryName,
        wantLeading: true,
        action: [
          ValueListenableBuilder(
            valueListenable: shoppingCartCount,
            builder: (context, value, child) {
              return CustomBadge(icon: Icons.shopping_cart, count: shoppingCartCount.value, color: AppColors.black);
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 240),
        itemCount: widget.productList.length,
        itemBuilder: (context, proIndex) => Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          width: 1.sw * 0.5,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(offset: Offset(0, 0), color: Color(0X2000001A), blurRadius: 16)],
          ),
          child: Stack(
            alignment: AlignmentGeometry.topRight,
            children: [
              Column(
                crossAxisAlignment: .start,
                children: [
                  Image.asset(widget.productList[proIndex].productImage, height: 100.h, width: 100.w),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(widget.productList[proIndex].productPrice, style: AppTextStyle.productPrice),
                      Text(widget.productList[proIndex].productWeight, style: AppTextStyle.productWeight),
                    ],
                  ),
                  Text(widget.productList[proIndex].productName, style: AppTextStyle.productNameStyle),
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
                      shoppingCartCount.value = cartProduct.length;
                    },
                    child: cartProduct.contains(widget.productList[proIndex]) ? addToCart(widget.productList[proIndex]) : addToCartIcon(widget.productList[proIndex]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
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
            boxShadow: [],
          ),
          child: Column(
            mainAxisAlignment: .spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  product.cartCount.value++;
                },
                style: IconButton.styleFrom(overlayColor: AppColors.primaryColor, shape: CircleBorder()),
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
                style: IconButton.styleFrom(overlayColor: AppColors.primaryColor, shape: CircleBorder(), alignment: .center),
                visualDensity: VisualDensity(vertical: -4),
                icon: product.cartCount.value == 1 ? Icon(CupertinoIcons.delete, color: AppColor.red, weight: 30, size: 16.sp) : Icon(Icons.minimize_rounded, weight: 50, size: 18.sp),
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
      options: CircularDottedBorderOptions(color: AppColors.primaryColor, strokeWidth: 2, dashPattern: [5, 7], strokeCap: StrokeCap.round),
      child: Container(
        decoration: BoxDecoration(color: AppColors.tabBarColor, shape: .circle),
        padding: EdgeInsets.all(2),
        child: Icon(Icons.add, color: AppColors.primaryColor, size: 18.sp),
      ),
    );
  }
}
