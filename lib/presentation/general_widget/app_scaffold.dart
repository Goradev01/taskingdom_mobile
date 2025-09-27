 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskingdom/core/extensions/context_extensions.dart';
import 'package:taskingdom/gen/assets.gen.dart';
import 'package:taskingdom/presentation/general_widget/app_bar.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.body,
    super.key,
    this.resizeToAvoidBottomInset,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.footerButton,
    this.underFooterChild,
    this.extendBody = false,
    this.backgroundColor,
    this.backgroundImage,
    this.showBackImage = false,
    this.footerPadding,
    this.sidePadding,
    this.appBar,
  });
  final Widget body;
  final bool? resizeToAvoidBottomInset;

  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? footerButton;
  final Widget? underFooterChild;
  final EdgeInsetsGeometry? footerPadding;
  final EdgeInsetsGeometry? sidePadding;
  final bool extendBody;
  final Color? backgroundColor;
  final ImageProvider? backgroundImage;
  final bool showBackImage;
  final CustomAppbar? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ?? const CustomAppbar(showBackButton: false),
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: SafeArea(
        child: Padding(
          padding: sidePadding ?? const EdgeInsets.all(16),
          child: SizedBox(
            height: context.height,
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (showBackImage)
                  Positioned.fill(
                    child: Image(
                      image: backgroundImage ?? Assets.images.frame1171275399.provider(),
                      fit: BoxFit.cover,
                      repeat: ImageRepeat.repeat,
                    ),
                  ),
                body,
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      persistentFooterButtons: (footerButton != null)
          ? [
              Padding(
                padding:
                    footerPadding ?? EdgeInsets.symmetric(horizontal: 10.w),
                child: Container(
                  margin: context.bottomPaddingForTextField,
                  child: Column(
                    children: [
                      footerButton!,
                      16.verticalSpace,
                      if (underFooterChild != null) underFooterChild!,
                    ],
                  ),
                ),
              ),
            ]
          : null,
      extendBody: extendBody,
    );
  }
}
