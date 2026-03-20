import 'package:flutter/cupertino.dart';
import 'package:new_app/features/store_page/data/model/product_model.dart';
import 'package:new_app/features/store_page/data/model/sub_category_model.dart';

import '../../../../core/constant/app_constant.dart';

class CategoryModel {
  CategoryModel({required this.categoryImage, required this.categoryName, required this.subcategory});
  String categoryImage;
  String categoryName;
  List<SubCategoryModel> subcategory;
}

ValueNotifier<int> shoppingCartCount = ValueNotifier(0);
List<Product> cartProduct = [];

List<CategoryModel> categories = [
  CategoryModel(
    categoryImage: AppImage.category1,
    categoryName: AppText.categoryName1,
    subcategory: [
      SubCategoryModel(
        subCategoryName: AppText.subCategory1,
        products: [
          Product(productImage: AppImage.milk1, productName: AppText.milk1name, productPrice: AppText.milk1Price, productWeight: AppText.milk1Weight, cartCount: ValueNotifier(0)),
          Product(productImage: AppImage.milk2, productName: AppText.milk2name, productPrice: AppText.milk2Price, productWeight: AppText.milk2Weight, cartCount: ValueNotifier(0)),
          Product(productImage: AppImage.milk3, productName: AppText.milk3name, productPrice: AppText.milk3Price, productWeight: AppText.milk3Weight, cartCount: ValueNotifier(0)),
          Product(productImage: AppImage.milk3, productName: AppText.milk3name, productPrice: AppText.milk3Price, productWeight: AppText.milk3Weight, cartCount: ValueNotifier(0)),
          Product(productImage: AppImage.milk3, productName: AppText.milk3name, productPrice: AppText.milk3Price, productWeight: AppText.milk3Weight, cartCount: ValueNotifier(0)),
          Product(productImage: AppImage.milk3, productName: AppText.milk3name, productPrice: AppText.milk3Price, productWeight: AppText.milk3Weight, cartCount: ValueNotifier(0)),
          Product(productImage: AppImage.milk3, productName: AppText.milk3name, productPrice: AppText.milk3Price, productWeight: AppText.milk3Weight, cartCount: ValueNotifier(0)),
          Product(productImage: AppImage.milk3, productName: AppText.milk3name, productPrice: AppText.milk3Price, productWeight: AppText.milk3Weight, cartCount: ValueNotifier(0)),
        ],
      ),
      SubCategoryModel(
        subCategoryName: AppText.subCategory2,
        products: [
          Product(productImage: AppImage.iceCream1, productName: AppText.iceCream1name, productPrice: AppText.iceCream1Price, productWeight: AppText.iceCream1Weight, cartCount: ValueNotifier(0)),
          Product(productImage: AppImage.iceCream2, productName: AppText.iceCream2name, productPrice: AppText.iceCream2Price, productWeight: AppText.iceCream2Weight, cartCount: ValueNotifier(0)),
          Product(productImage: AppImage.iceCream2, productName: AppText.iceCream2name, productPrice: AppText.iceCream2Price, productWeight: AppText.iceCream2Weight, cartCount: ValueNotifier(0)),
          Product(productImage: AppImage.iceCream2, productName: AppText.iceCream2name, productPrice: AppText.iceCream2Price, productWeight: AppText.iceCream2Weight, cartCount: ValueNotifier(0)),
          Product(productImage: AppImage.iceCream2, productName: AppText.iceCream2name, productPrice: AppText.iceCream2Price, productWeight: AppText.iceCream2Weight, cartCount: ValueNotifier(0)),
          Product(productImage: AppImage.iceCream2, productName: AppText.iceCream2name, productPrice: AppText.iceCream2Price, productWeight: AppText.iceCream2Weight, cartCount: ValueNotifier(0)),
          Product(productImage: AppImage.iceCream2, productName: AppText.iceCream2name, productPrice: AppText.iceCream2Price, productWeight: AppText.iceCream2Weight, cartCount: ValueNotifier(0)),
          Product(productImage: AppImage.iceCream2, productName: AppText.iceCream2name, productPrice: AppText.iceCream2Price, productWeight: AppText.iceCream2Weight, cartCount: ValueNotifier(0)),
        ],
      ),
    ],
  ),
  CategoryModel(
    categoryImage: AppImage.category2,
    categoryName: AppText.categoryName2,
    subcategory: [SubCategoryModel(subCategoryName: '', products: [])],
  ),
  CategoryModel(
    categoryImage: AppImage.category3,
    categoryName: AppText.categoryName3,
    subcategory: [SubCategoryModel(subCategoryName: '', products: [])],
  ),
  CategoryModel(
    categoryImage: AppImage.category4,
    categoryName: AppText.categoryName4,
    subcategory: [SubCategoryModel(subCategoryName: '', products: [])],
  ),
  CategoryModel(
    categoryImage: AppImage.category5,
    categoryName: AppText.categoryName5,
    subcategory: [SubCategoryModel(subCategoryName: '', products: [])],
  ),
];
