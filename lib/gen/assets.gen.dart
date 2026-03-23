// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/brand_img.png
  AssetGenImage get brandImg =>
      const AssetGenImage('assets/images/brand_img.png');

  /// File path: assets/images/category1.jpg
  AssetGenImage get category1 =>
      const AssetGenImage('assets/images/category1.jpg');

  /// File path: assets/images/category2.png
  AssetGenImage get category2 =>
      const AssetGenImage('assets/images/category2.png');

  /// File path: assets/images/category3.png
  AssetGenImage get category3 =>
      const AssetGenImage('assets/images/category3.png');

  /// File path: assets/images/category4.png
  AssetGenImage get category4 =>
      const AssetGenImage('assets/images/category4.png');

  /// File path: assets/images/category5.png
  AssetGenImage get category5 =>
      const AssetGenImage('assets/images/category5.png');

  /// File path: assets/images/iceCream1.png
  AssetGenImage get iceCream1 =>
      const AssetGenImage('assets/images/iceCream1.png');

  /// File path: assets/images/iceCream2.jpg
  AssetGenImage get iceCream2 =>
      const AssetGenImage('assets/images/iceCream2.jpg');

  /// File path: assets/images/login_page_image.png
  AssetGenImage get loginPageImage =>
      const AssetGenImage('assets/images/login_page_image.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/logo2.png
  AssetGenImage get logo2 => const AssetGenImage('assets/images/logo2.png');

  /// File path: assets/images/milk1.jpg
  AssetGenImage get milk1 => const AssetGenImage('assets/images/milk1.jpg');

  /// File path: assets/images/milk2.png
  AssetGenImage get milk2 => const AssetGenImage('assets/images/milk2.png');

  /// File path: assets/images/milk3.png
  AssetGenImage get milk3 => const AssetGenImage('assets/images/milk3.png');

  /// File path: assets/images/page_image1.png
  AssetGenImage get pageImage1 =>
      const AssetGenImage('assets/images/page_image1.png');

  /// File path: assets/images/page_image2.png
  AssetGenImage get pageImage2 =>
      const AssetGenImage('assets/images/page_image2.png');

  /// File path: assets/images/page_image3.png
  AssetGenImage get pageImage3 =>
      const AssetGenImage('assets/images/page_image3.png');

  /// File path: assets/images/profile1.png
  AssetGenImage get profile1 =>
      const AssetGenImage('assets/images/profile1.png');

  /// File path: assets/images/profile2.png
  AssetGenImage get profile2 =>
      const AssetGenImage('assets/images/profile2.png');

  /// File path: assets/images/profile3.png
  AssetGenImage get profile3 =>
      const AssetGenImage('assets/images/profile3.png');

  /// File path: assets/images/shop1.jpg
  AssetGenImage get shop1 => const AssetGenImage('assets/images/shop1.jpg');

  /// File path: assets/images/shop2.jpg
  AssetGenImage get shop2 => const AssetGenImage('assets/images/shop2.jpg');

  /// File path: assets/images/shop3.jpg
  AssetGenImage get shop3 => const AssetGenImage('assets/images/shop3.jpg');

  /// File path: assets/images/shop4.jpg
  AssetGenImage get shop4 => const AssetGenImage('assets/images/shop4.jpg');

  /// File path: assets/images/shop5.jpg
  AssetGenImage get shop5 => const AssetGenImage('assets/images/shop5.jpg');

  /// File path: assets/images/strore.jpg
  AssetGenImage get strore => const AssetGenImage('assets/images/strore.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
    brandImg,
    category1,
    category2,
    category3,
    category4,
    category5,
    iceCream1,
    iceCream2,
    loginPageImage,
    logo,
    logo2,
    milk1,
    milk2,
    milk3,
    pageImage1,
    pageImage2,
    pageImage3,
    profile1,
    profile2,
    profile3,
    shop1,
    shop2,
    shop3,
    shop4,
    shop5,
    strore,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
