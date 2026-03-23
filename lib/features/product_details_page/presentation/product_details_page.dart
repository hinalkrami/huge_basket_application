import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_button_style.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/features/category_subcategory_page/data/model/category_model.dart';
import 'package:new_app/widget/custom_bedge.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../values/export.dart';
import '../../../widget/custom_app_bar.dart';
import '../../category_subcategory_page/data/model/product_model.dart';

class ProductDetailsPage extends StatefulWidget {
  ProductDetailsPage({super.key, required this.product});
  Product product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final PageController _pageController = PageController();
  ValueNotifier<bool> isProductInList = ValueNotifier(false);
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isProductInList.value = cartProduct.contains(widget.product);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Product Details',
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
      body: Stack(
        alignment: .bottomCenter,
        children: [
          Column(
            spacing: 10.h,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(blurRadius: 16.r, color: Colors.grey.shade300)],
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    SizedBox(
                      height: 1.sh * 0.25,
                      child: PageView.builder(controller: _pageController, itemCount: 5, itemBuilder: (context, index) => Image.asset(widget.product.productImage)),
                    ),
                    20.verticalSpace,
                    Center(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 5,
                        effect: SlideEffect(type: .slideUnder, activeDotColor: AppColors.primaryColor, dotColor: AppColor.grey.withAlpha(100), dotHeight: 1.sh * 0.0035, dotWidth: 1.sw * 0.04),
                      ),
                    ),
                    20.verticalSpace,
                    Text(widget.product.productName, style: textRegularInter),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(widget.product.productPrice, style: textSemiBoldInter),
                        ValueListenableBuilder(
                          valueListenable: widget.product.isSelected,
                          builder: (context, value, child) {
                            return InkWell(
                              onTap: () {
                                widget.product.isSelected.value = true;
                                if (!cartProduct.contains(widget.product)) {
                                  cartProduct.add(widget.product);
                                  print(cartProduct.first.productName);
                                }
                                shoppingCartCount.value = cartProduct.length;
                                isProductInList.value = cartProduct.contains(widget.product);
                              },
                              child: ValueListenableBuilder(
                                valueListenable: isProductInList,
                                builder: (context, value, child) {
                                  return cartProduct.contains(widget.product) || isProductInList.value ? addToCart(widget.product) : addToCartIcon(widget.product);
                                },
                              ),
                            );
                          },
                        ),
                        Text(widget.product.productWeight),
                      ],
                    ),
                  ],
                ).wrapPaddingSymmetric(vertical: 10.h, horizontal: 20.w),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(blurRadius: 16.r, color: Colors.grey.shade300)],
                ),
                child: SizedBox(
                  height: 1.sh * 0.4,
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: .start,
                      children: [
                        Text('Product Details'),
                        Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem sum has been the industry\'s standard dummy text ever since the 1500s, when an unknown rinter ok a galley of type and scrambled it tomake a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                        ),
                      ],
                    ),
                  ),
                ).wrapPaddingSymmetric(vertical: 10.h, horizontal: 20.w),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(offset: Offset(0, 15), color: Colors.grey.shade100, blurRadius: 25.r)],
            ),
            child: ValueListenableBuilder(
              valueListenable: isProductInList,
              builder: (context, value, child) {
                return ElevatedButton.icon(
                  onPressed: isProductInList.value
                      ? null
                      : () {
                          isProductInList.value = true;
                          widget.product.isSelected.value = true;
                          cartProduct.add(widget.product);
                          shoppingCartCount.value = cartProduct.length;
                        },
                  style: AppButtonStyle(wantChangeSize: true, width: 1.sw * 0.7).buttonStyle,
                  label: Text('Add to Cart'),
                  icon: Icon(Icons.shopping_bag_rounded),
                ).wrapPaddingAll(20.dm);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget addToCart(Product product) {
    return ValueListenableBuilder(
      valueListenable: product.cartCount,
      builder: (context, value, child) {
        return Container(
          height: 1.sh * 0.05,
          width: 1.sw * 0.4,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.primaryColor, width: 2),
          ),
          child: Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  if (product.cartCount.value <= 1) {
                    product.isSelected.value = false;
                    product.cartCount.value = 0;
                    if (cartProduct.contains(product)) {
                      cartProduct.remove(product);
                    }
                    shoppingCartCount.value = cartProduct.length;
                    isProductInList.value = cartProduct.contains(widget.product);
                  } else {
                    product.cartCount.value--;
                  }
                },
                style: IconButton.styleFrom(overlayColor: AppColors.primaryColor, shape: CircleBorder(), alignment: .center),
                visualDensity: VisualDensity(vertical: -4),
                icon: product.cartCount.value == 1 ? Icon(CupertinoIcons.delete, color: AppColor.red, weight: 30, size: 18.sp) : Icon(Icons.minimize_rounded, weight: 50, size: 18.sp),
              ),
              Text(
                '${product.cartCount.value}',
                style: TextStyle(fontSize: 16.sp, fontWeight: .w600),
              ),
              IconButton(
                onPressed: () {
                  product.cartCount.value++;
                },
                style: IconButton.styleFrom(overlayColor: AppColors.primaryColor, shape: CircleBorder()),
                iconSize: 25.sp,
                splashRadius: 20.r,
                icon: Icon(Icons.add_rounded, color: AppColors.black, weight: 30),
                visualDensity: VisualDensity(vertical: -4, horizontal: 0),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget addToCartIcon(Product product) {
    // product.cartCount.value = 1;
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
