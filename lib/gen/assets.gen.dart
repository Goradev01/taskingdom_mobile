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

  /// File path: assets/images/Avatar.png
  AssetGenImage get avatar => const AssetGenImage('assets/images/Avatar.png');

  /// File path: assets/images/Frame 1171275399.png
  AssetGenImage get frame1171275399 =>
      const AssetGenImage('assets/images/Frame 1171275399.png');

  /// File path: assets/images/TASKINGDOM.zip
  String get taskingdom => 'assets/images/TASKINGDOM.zip';

  /// File path: assets/images/herocard.png
  AssetGenImage get herocard =>
      const AssetGenImage('assets/images/herocard.png');

  /// File path: assets/images/pubg.png
  AssetGenImage get pubg => const AssetGenImage('assets/images/pubg.png');

  /// File path: assets/images/task.png
  AssetGenImage get task => const AssetGenImage('assets/images/task.png');

  /// File path: assets/images/taskprogess.png
  AssetGenImage get taskprogess =>
      const AssetGenImage('assets/images/taskprogess.png');

  /// List of all assets
  List<dynamic> get values => [
    avatar,
    frame1171275399,
    taskingdom,
    herocard,
    pubg,
    task,
    taskprogess,
  ];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/arrow-down.svg
  String get arrowDown => 'assets/svgs/arrow-down.svg';

  /// File path: assets/svgs/axiforma-regular.zip
  String get axiformaRegular => 'assets/svgs/axiforma-regular.zip';

  /// File path: assets/svgs/back.svg
  String get back => 'assets/svgs/back.svg';

  /// File path: assets/svgs/calendar.svg
  String get calendar => 'assets/svgs/calendar.svg';

  /// File path: assets/svgs/calendar1.svg
  String get calendar1 => 'assets/svgs/calendar1.svg';

  /// File path: assets/svgs/camera.svg
  String get camera => 'assets/svgs/camera.svg';

  /// File path: assets/svgs/delete.svg
  String get delete => 'assets/svgs/delete.svg';

  /// File path: assets/svgs/fluent_people-star-32-filled.svg
  String get fluentPeopleStar32Filled =>
      'assets/svgs/fluent_people-star-32-filled.svg';

  /// File path: assets/svgs/formkit_add.svg
  String get formkitAdd => 'assets/svgs/formkit_add.svg';

  /// File path: assets/svgs/gamenav.svg
  String get gamenav => 'assets/svgs/gamenav.svg';

  /// File path: assets/svgs/gamenav_inactive.svg
  String get gamenavInactive => 'assets/svgs/gamenav_inactive.svg';

  /// File path: assets/svgs/heart.svg
  String get heart => 'assets/svgs/heart.svg';

  /// File path: assets/svgs/homenav.svg
  String get homenav => 'assets/svgs/homenav.svg';

  /// File path: assets/svgs/homenav_inactive.svg
  String get homenavInactive => 'assets/svgs/homenav_inactive.svg';

  /// File path: assets/svgs/message.svg
  String get message => 'assets/svgs/message.svg';

  /// File path: assets/svgs/notification.svg
  String get notification => 'assets/svgs/notification.svg';

  /// File path: assets/svgs/profilenav.svg
  String get profilenav => 'assets/svgs/profilenav.svg';

  /// File path: assets/svgs/profilenav_inactive.svg
  String get profilenavInactive => 'assets/svgs/profilenav_inactive.svg';

  /// File path: assets/svgs/share.svg
  String get share => 'assets/svgs/share.svg';

  /// File path: assets/svgs/star.svg
  String get star => 'assets/svgs/star.svg';

  /// File path: assets/svgs/taskcomplete.svg
  String get taskcomplete => 'assets/svgs/taskcomplete.svg';

  /// File path: assets/svgs/totalpoint.svg
  String get totalpoint => 'assets/svgs/totalpoint.svg';

  /// File path: assets/svgs/trophy.svg
  String get trophy => 'assets/svgs/trophy.svg';

  /// File path: assets/svgs/vip.svg
  String get vip => 'assets/svgs/vip.svg';

  /// List of all assets
  List<String> get values => [
    arrowDown,
    axiformaRegular,
    back,
    calendar,
    calendar1,
    camera,
    delete,
    fluentPeopleStar32Filled,
    formkitAdd,
    gamenav,
    gamenavInactive,
    heart,
    homenav,
    homenavInactive,
    message,
    notification,
    profilenav,
    profilenavInactive,
    share,
    star,
    taskcomplete,
    totalpoint,
    trophy,
    vip,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
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
