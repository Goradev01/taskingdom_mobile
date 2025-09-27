
// ignore_for_file: lines_longer_than_80_chars, use_if_null_to_convert_nulls_to_bools, avoid_bool_literals_in_conditional_expressions
 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskingdom/core/extensions/texttheme_extensions.dart';
import 'package:taskingdom/core/extensions/widget_extensions.dart';
import 'package:taskingdom/core/utils/colors.dart';
import 'package:taskingdom/core/utils/styles.dart';
import 'package:taskingdom/gen/fonts.gen.dart';
import 'package:taskingdom/presentation/general_widget/app_svg.dart';

/// A custom Bundle button. This was built to adapt to the our in-house button style.
/// Works similarly to default flutter button except for its aesthetic changes.
/// It currently support various AppButtonStyles
/// [AppButtonStyle.primary],
/// [AppButtonStyle.secondary],
/// which primarily decides the background and foreground colors of the buttons only.
/// Its represented by various states such as *isEnabled* which alters the state of the button
/// view and also disable it click action, similar to the *isLoading* which enables the loading view of the button.
/// ### Params
/// * [text] - represents the text to show in the button
/// * [height] - default button height
/// * [width] - default button width
/// * [isEnabled] - determines whether button should be clickable, invoke callback or not. Can also be use to modify
/// how button view reacts to click events and UI changes.
/// * [isLoading] - determines whether button should show loading state or not
/// * [buttonStyle] - can be use to determine the style applied to button as mentioned above
/// * [onPressed] - a simple callback that gets triggered when button is pressed
///

class AppButton extends StatefulWidget {
  const AppButton({
    required this.text, required this.onPressed, this.height = AppButtonStyle.buttonDefaultHeight,
    this.width = AppButtonStyle.buttonDefaultWidth,
    this.isLoading = AppButtonStyle.buttonIsLoading,
    this.isEnabled = AppButtonStyle.buttonIsEnable,
    this.cornerRadius = AppButtonStyle.buttonCornerRadius,
    this.buttonStyle,
    this.leading,
    this.trailing,
    this.textStyle,
    this.color,
    this.borderColor,
    this.isOutline,
    super.key,
  });
  final String text;
  final double height;
  final double width;
  final double cornerRadius;
  final bool isEnabled;
  final bool isLoading;
  final bool? isOutline;
  final Color? color;
  final Color? borderColor;
  final AppButtonStyle? buttonStyle;
  final TextStyle? textStyle;

  final VoidCallback onPressed;
  final String? leading;
  final String? trailing;

  @override
  State<AppButton> createState() => _AppButton();
}

class _AppButton extends State<AppButton> {
  bool isClicked = false;
  late AppButtonStyle _buttonStyle;

  @override
  void initState() {
    _buttonStyle = widget.buttonStyle ?? AppButtonStyle.primary();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AppButton oldWidget) {
    _buttonStyle = widget.buttonStyle ?? AppButtonStyle.primary();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: isActive() ? widget.onPressed : null,
        child: Container(
          alignment: Alignment.center,
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            border: (widget.isOutline == true)
                ? AppButtonStyle.outline().border
                : Border.all(color: Colors.transparent),
            boxShadow: (widget.isOutline == true)
                ? []
                : [
                    BoxShadow(
                      color: widget.borderColor ?? _buttonStyle.borderColor,
                      offset: const Offset(0, 5),
                    ),
                  ],
            borderRadius: BorderRadius.circular(widget.cornerRadius),
            color: widget.color ?? _buttonStyle.background,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!widget.isLoading)
                FittedBox(
                    child: Row(
                  children: [
                    if (widget.leading != null) ...[
                      AppSvgIcon(
                        path: widget.leading!,
                        fit: BoxFit.scaleDown,
                      ).withContainer(
                          width: 32.w,
                          height: 32.h,
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1.86,
                            color: AppColors.primaryColor,
                          ),),
                      5.horizontalSpace,
                    ],
                    Text(widget.text,
                        style: widget.textStyle ??
                            _buttonStyle.textStyle ??
                            context.textTheme.bodyMedium?.copyWith(
                              color: _buttonStyle.textColor,
                              fontFamily: FontFamily.clash,
                              fontSize: 16,
                            ),),
                    if (widget.trailing != null) ...[
                      10.horizontalSpace,
                      AppSvgIcon(
                        path: widget.trailing!,
                        fit: BoxFit.scaleDown,
                      ),
                    ],
                  ],
                ),),
              if (widget.isLoading) ...[
                const CircularProgressIndicator.adaptive(),
              ],
            ],
          ),
        ),);
  }

  bool isActive() => widget.isEnabled
      ? widget.isLoading
          ? false
          : true
      : false;
}
