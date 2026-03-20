import 'package:new_app/features/store_page/data/model/product_model.dart';

class SubCategoryModel {
  SubCategoryModel({required this.subCategoryName, required this.products});
  String subCategoryName;
  List<Product> products;
}
