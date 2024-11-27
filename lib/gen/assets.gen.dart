import 'package:flutter/widgets.dart';

class $AssetsImgGen {
  const $AssetsImgGen();

  AssetGenImage get logo => const AssetGenImage('assets/logo.webp');
  AssetGenImage get plusIcon => const AssetGenImage('assets/plus_icon.webp');
  AssetGenImage get loopIcon => const AssetGenImage('assets/loop_loop.webp');
  AssetGenImage get warningIcon => const AssetGenImage('assets/warning_icon.webp');
  AssetGenImage get add1 => const AssetGenImage('assets/add_1.webp');
  AssetGenImage get add2 => const AssetGenImage('assets/add_2.webp');
  AssetGenImage get add3 => const AssetGenImage('assets/add_3.webp');
  AssetGenImage get add4 => const AssetGenImage('assets/add_4.webp');
  AssetGenImage get add5 => const AssetGenImage('assets/add_5.webp');

  List<AssetGenImage> get values => [
        logo,
        plusIcon,
        loopIcon,
        warningIcon,
        add1,
        add2,
        add3,
        add4,
        add5,
      ];
}

class Assets {
  Assets._();

  static const $AssetsImgGen icon = $AssetsImgGen();

  static List<dynamic> get values => [icon];
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size});

  final String _assetName;

  final Size? size;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
