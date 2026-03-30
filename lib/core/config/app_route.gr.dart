// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_route.dart';

/// generated route for
/// [AddAddressPage]
class AddAddressRoute extends PageRouteInfo<void> {
  const AddAddressRoute({List<PageRouteInfo>? children})
    : super(AddAddressRoute.name, initialChildren: children);

  static const String name = 'AddAddressRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddAddressPage();
    },
  );
}

/// generated route for
/// [CategoryPage]
class CategoryRoute extends PageRouteInfo<CategoryRouteArgs> {
  CategoryRoute({
    Key? key,
    required ValueNotifier<int> categoryIndex,
    List<PageRouteInfo>? children,
  }) : super(
         CategoryRoute.name,
         args: CategoryRouteArgs(key: key, categoryIndex: categoryIndex),
         initialChildren: children,
       );

  static const String name = 'CategoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CategoryRouteArgs>();
      return CategoryPage(key: args.key, categoryIndex: args.categoryIndex);
    },
  );
}

class CategoryRouteArgs {
  const CategoryRouteArgs({this.key, required this.categoryIndex});

  final Key? key;

  final ValueNotifier<int> categoryIndex;

  @override
  String toString() {
    return 'CategoryRouteArgs{key: $key, categoryIndex: $categoryIndex}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CategoryRouteArgs) return false;
    return key == other.key && categoryIndex == other.categoryIndex;
  }

  @override
  int get hashCode => key.hashCode ^ categoryIndex.hashCode;
}

/// generated route for
/// [DetailsPage]
class DetailsRoute extends PageRouteInfo<void> {
  const DetailsRoute({List<PageRouteInfo>? children})
    : super(DetailsRoute.name, initialChildren: children);

  static const String name = 'DetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DetailsPage();
    },
  );
}

/// generated route for
/// [EditAddressPage]
class EditAddressRoute extends PageRouteInfo<EditAddressRouteArgs> {
  EditAddressRoute({
    Key? key,
    required int? index,
    required AddressModel? address,
    List<PageRouteInfo>? children,
  }) : super(
         EditAddressRoute.name,
         args: EditAddressRouteArgs(key: key, index: index, address: address),
         initialChildren: children,
       );

  static const String name = 'EditAddressRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditAddressRouteArgs>();
      return EditAddressPage(
        key: args.key,
        index: args.index,
        address: args.address,
      );
    },
  );
}

class EditAddressRouteArgs {
  const EditAddressRouteArgs({
    this.key,
    required this.index,
    required this.address,
  });

  final Key? key;

  final int? index;

  final AddressModel? address;

  @override
  String toString() {
    return 'EditAddressRouteArgs{key: $key, index: $index, address: $address}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EditAddressRouteArgs) return false;
    return key == other.key && index == other.index && address == other.address;
  }

  @override
  int get hashCode => key.hashCode ^ index.hashCode ^ address.hashCode;
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginPage();
    },
  );
}

/// generated route for
/// [MainHomePage]
class MainHomeRoute extends PageRouteInfo<void> {
  const MainHomeRoute({List<PageRouteInfo>? children})
    : super(MainHomeRoute.name, initialChildren: children);

  static const String name = 'MainHomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainHomePage();
    },
  );
}

/// generated route for
/// [ManageAddressPage]
class ManageAddressRoute extends PageRouteInfo<void> {
  const ManageAddressRoute({List<PageRouteInfo>? children})
    : super(ManageAddressRoute.name, initialChildren: children);

  static const String name = 'ManageAddressRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ManageAddressPage();
    },
  );
}

/// generated route for
/// [MyOrderPage]
class MyOrderRoute extends PageRouteInfo<void> {
  const MyOrderRoute({List<PageRouteInfo>? children})
    : super(MyOrderRoute.name, initialChildren: children);

  static const String name = 'MyOrderRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyOrderPage();
    },
  );
}

/// generated route for
/// [ProductDetailsPage]
class ProductDetailsRoute extends PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    Key? key,
    required Product product,
    List<PageRouteInfo>? children,
  }) : super(
         ProductDetailsRoute.name,
         args: ProductDetailsRouteArgs(key: key, product: product),
         initialChildren: children,
       );

  static const String name = 'ProductDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailsRouteArgs>();
      return ProductDetailsPage(key: args.key, product: args.product);
    },
  );
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({this.key, required this.product});

  final Key? key;

  final Product product;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, product: $product}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductDetailsRouteArgs) return false;
    return key == other.key && product == other.product;
  }

  @override
  int get hashCode => key.hashCode ^ product.hashCode;
}

/// generated route for
/// [ProductListingPage]
class ProductListingRoute extends PageRouteInfo<ProductListingRouteArgs> {
  ProductListingRoute({
    Key? key,
    required List<Product> productList,
    required String subcategoryName,
    List<PageRouteInfo>? children,
  }) : super(
         ProductListingRoute.name,
         args: ProductListingRouteArgs(
           key: key,
           productList: productList,
           subcategoryName: subcategoryName,
         ),
         initialChildren: children,
       );

  static const String name = 'ProductListingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductListingRouteArgs>();
      return ProductListingPage(
        key: args.key,
        productList: args.productList,
        subcategoryName: args.subcategoryName,
      );
    },
  );
}

class ProductListingRouteArgs {
  const ProductListingRouteArgs({
    this.key,
    required this.productList,
    required this.subcategoryName,
  });

  final Key? key;

  final List<Product> productList;

  final String subcategoryName;

  @override
  String toString() {
    return 'ProductListingRouteArgs{key: $key, productList: $productList, subcategoryName: $subcategoryName}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductListingRouteArgs) return false;
    return key == other.key &&
        const ListEquality<Product>().equals(productList, other.productList) &&
        subcategoryName == other.subcategoryName;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const ListEquality<Product>().hash(productList) ^
      subcategoryName.hashCode;
}

/// generated route for
/// [ProductPage]
class ProductRoute extends PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    Key? key,
    required List<Product> productList,
    required ValueNotifier<int> subCategoryIndex,
    required int subIndex,
    required ValueNotifier<int> categoryIndex,
    List<PageRouteInfo>? children,
  }) : super(
         ProductRoute.name,
         args: ProductRouteArgs(
           key: key,
           productList: productList,
           subCategoryIndex: subCategoryIndex,
           subIndex: subIndex,
           categoryIndex: categoryIndex,
         ),
         initialChildren: children,
       );

  static const String name = 'ProductRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductRouteArgs>();
      return ProductPage(
        key: args.key,
        productList: args.productList,
        subCategoryIndex: args.subCategoryIndex,
        subIndex: args.subIndex,
        categoryIndex: args.categoryIndex,
      );
    },
  );
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    required this.productList,
    required this.subCategoryIndex,
    required this.subIndex,
    required this.categoryIndex,
  });

  final Key? key;

  final List<Product> productList;

  final ValueNotifier<int> subCategoryIndex;

  final int subIndex;

  final ValueNotifier<int> categoryIndex;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, productList: $productList, subCategoryIndex: $subCategoryIndex, subIndex: $subIndex, categoryIndex: $categoryIndex}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductRouteArgs) return false;
    return key == other.key &&
        const ListEquality<Product>().equals(productList, other.productList) &&
        subCategoryIndex == other.subCategoryIndex &&
        subIndex == other.subIndex &&
        categoryIndex == other.categoryIndex;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const ListEquality<Product>().hash(productList) ^
      subCategoryIndex.hashCode ^
      subIndex.hashCode ^
      categoryIndex.hashCode;
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfilePage();
    },
  );
}

/// generated route for
/// [ShopDetailsPage]
class ShopDetailsRoute extends PageRouteInfo<ShopDetailsRouteArgs> {
  ShopDetailsRoute({
    Key? key,
    required String image,
    required String title,
    required String subTitle,
    required String trailingText,
    required String subTitle2,
    List<PageRouteInfo>? children,
  }) : super(
         ShopDetailsRoute.name,
         args: ShopDetailsRouteArgs(
           key: key,
           image: image,
           title: title,
           subTitle: subTitle,
           trailingText: trailingText,
           subTitle2: subTitle2,
         ),
         initialChildren: children,
       );

  static const String name = 'ShopDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ShopDetailsRouteArgs>();
      return ShopDetailsPage(
        key: args.key,
        image: args.image,
        title: args.title,
        subTitle: args.subTitle,
        trailingText: args.trailingText,
        subTitle2: args.subTitle2,
      );
    },
  );
}

class ShopDetailsRouteArgs {
  const ShopDetailsRouteArgs({
    this.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.trailingText,
    required this.subTitle2,
  });

  final Key? key;

  final String image;

  final String title;

  final String subTitle;

  final String trailingText;

  final String subTitle2;

  @override
  String toString() {
    return 'ShopDetailsRouteArgs{key: $key, image: $image, title: $title, subTitle: $subTitle, trailingText: $trailingText, subTitle2: $subTitle2}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ShopDetailsRouteArgs) return false;
    return key == other.key &&
        image == other.image &&
        title == other.title &&
        subTitle == other.subTitle &&
        trailingText == other.trailingText &&
        subTitle2 == other.subTitle2;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      image.hashCode ^
      title.hashCode ^
      subTitle.hashCode ^
      trailingText.hashCode ^
      subTitle2.hashCode;
}

/// generated route for
/// [StorePage]
class StoreRoute extends PageRouteInfo<StoreRouteArgs> {
  StoreRoute({
    Key? key,
    required String add,
    required String storeImage,
    required String shopName,
    List<PageRouteInfo>? children,
  }) : super(
         StoreRoute.name,
         args: StoreRouteArgs(
           key: key,
           add: add,
           storeImage: storeImage,
           shopName: shopName,
         ),
         initialChildren: children,
       );

  static const String name = 'StoreRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StoreRouteArgs>();
      return StorePage(
        key: args.key,
        add: args.add,
        storeImage: args.storeImage,
        shopName: args.shopName,
      );
    },
  );
}

class StoreRouteArgs {
  const StoreRouteArgs({
    this.key,
    required this.add,
    required this.storeImage,
    required this.shopName,
  });

  final Key? key;

  final String add;

  final String storeImage;

  final String shopName;

  @override
  String toString() {
    return 'StoreRouteArgs{key: $key, add: $add, storeImage: $storeImage, shopName: $shopName}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! StoreRouteArgs) return false;
    return key == other.key &&
        add == other.add &&
        storeImage == other.storeImage &&
        shopName == other.shopName;
  }

  @override
  int get hashCode =>
      key.hashCode ^ add.hashCode ^ storeImage.hashCode ^ shopName.hashCode;
}

/// generated route for
/// [SubCategoryPage]
class SubCategoryRoute extends PageRouteInfo<SubCategoryRouteArgs> {
  SubCategoryRoute({
    Key? key,
    required ValueNotifier<int> categoryIndex,
    required List<CategoryModel> categories,
    List<PageRouteInfo>? children,
  }) : super(
         SubCategoryRoute.name,
         args: SubCategoryRouteArgs(
           key: key,
           categoryIndex: categoryIndex,
           categories: categories,
         ),
         initialChildren: children,
       );

  static const String name = 'SubCategoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SubCategoryRouteArgs>();
      return SubCategoryPage(
        key: args.key,
        categoryIndex: args.categoryIndex,
        categories: args.categories,
      );
    },
  );
}

class SubCategoryRouteArgs {
  const SubCategoryRouteArgs({
    this.key,
    required this.categoryIndex,
    required this.categories,
  });

  final Key? key;

  final ValueNotifier<int> categoryIndex;

  final List<CategoryModel> categories;

  @override
  String toString() {
    return 'SubCategoryRouteArgs{key: $key, categoryIndex: $categoryIndex, categories: $categories}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SubCategoryRouteArgs) return false;
    return key == other.key &&
        categoryIndex == other.categoryIndex &&
        const ListEquality<CategoryModel>().equals(
          categories,
          other.categories,
        );
  }

  @override
  int get hashCode =>
      key.hashCode ^
      categoryIndex.hashCode ^
      const ListEquality<CategoryModel>().hash(categories);
}

/// generated route for
/// [VarificationPage]
class VarificationRoute extends PageRouteInfo<VarificationRouteArgs> {
  VarificationRoute({
    Key? key,
    required String phoneNumber,
    required String countryName,
    List<PageRouteInfo>? children,
  }) : super(
         VarificationRoute.name,
         args: VarificationRouteArgs(
           key: key,
           phoneNumber: phoneNumber,
           countryName: countryName,
         ),
         initialChildren: children,
       );

  static const String name = 'VarificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VarificationRouteArgs>();
      return VarificationPage(
        key: args.key,
        phoneNumber: args.phoneNumber,
        countryName: args.countryName,
      );
    },
  );
}

class VarificationRouteArgs {
  const VarificationRouteArgs({
    this.key,
    required this.phoneNumber,
    required this.countryName,
  });

  final Key? key;

  final String phoneNumber;

  final String countryName;

  @override
  String toString() {
    return 'VarificationRouteArgs{key: $key, phoneNumber: $phoneNumber, countryName: $countryName}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VarificationRouteArgs) return false;
    return key == other.key &&
        phoneNumber == other.phoneNumber &&
        countryName == other.countryName;
  }

  @override
  int get hashCode =>
      key.hashCode ^ phoneNumber.hashCode ^ countryName.hashCode;
}

/// generated route for
/// [WalkThroughPage]
class WalkThroughRoute extends PageRouteInfo<void> {
  const WalkThroughRoute({List<PageRouteInfo>? children})
    : super(WalkThroughRoute.name, initialChildren: children);

  static const String name = 'WalkThroughRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WalkThroughPage();
    },
  );
}
