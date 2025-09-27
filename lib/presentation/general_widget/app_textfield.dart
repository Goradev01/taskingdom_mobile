 
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskingdom/core/extensions/context_extensions.dart';
import 'package:taskingdom/core/extensions/texttheme_extensions.dart';
import 'package:taskingdom/core/utils/colors.dart';

class AppTextField extends StatefulWidget {
  const AppTextField(
      {super.key,
      this.textStyle,
      this.width,
      this.height = 62,
      this.labelSpace = 8,
      this.textCapitalization = TextCapitalization.sentences,
      this.onTap,
      this.decoration,
      this.hintStyle,
      this.backgroundColor,
      this.isLoading = false,
      this.readOnly = false,
      this.customLabel,
      this.hintText,
      this.controller,
      this.minLines = 1,
      this.obscureText = false,
      this.enabled = true,
      this.validateFunction,
      this.borderSide,
      this.onSaved,
      this.onChange,
      this.keyboardType,
      this.textInputAction,
      this.focusNode,
      this.nextFocusNode,
      this.submitAction,
      this.enableErrorMessage = true,
      this.maxLines = 1,
      this.onFieldSubmitted,
      this.suffixIcon,
      this.prefixIcon,
      this.bordercolor,
      this.autofocus,
      this.label,
      this.inputFormatters,
      this.borderRadius = 8,
      this.initialValue,
      this.labelSize,
      this.labelColor,
      this.cursorColor,
      this.textAlign,});
  final double? width;
  final double? height;
  final double? labelSize;
  final String? hintText;
  final TextEditingController? controller;
  final int? minLines;
  final int? maxLines;
  final bool? obscureText;
  final bool? enabled;
  final FormFieldValidator<String>? validateFunction;
  final void Function(String)? onSaved;
  final void Function(String)? onChange;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final VoidCallback? submitAction;
  final bool? enableErrorMessage;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? bordercolor;
  final Color? backgroundColor;
  final Color? labelColor;
  final Color? cursorColor;
  final bool? autofocus;
  final String? label;
  final InputDecoration? decoration;
  final List<TextInputFormatter>? inputFormatters;
  final bool isLoading;
  final bool readOnly;
  final double borderRadius;
  final double labelSpace;
  final String? initialValue;
  final Widget? customLabel;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final BorderSide? borderSide;
  final TextAlign? textAlign;
  final TextCapitalization textCapitalization;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  String? error;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.label!,style: context.textTheme.bodyMedium!.copyWith(
          color: AppColors.black21
        ),),
        8.verticalSpace,
        SizedBox(
          width: widget.width??context.width,
          child: TextFormField(
            textCapitalization: widget.textCapitalization,
            onTap: widget.onTap,
            readOnly: widget.readOnly,
            initialValue: widget.initialValue,
            textAlign: widget.textAlign ?? TextAlign.start,
            inputFormatters: widget.inputFormatters,
            autofocus: widget.autofocus ?? false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            enabled: widget.enabled,
            validator: widget.validateFunction != null
                ? widget.validateFunction!
                : (value) {
                    return null;
                  },
            onSaved: (val) {
              widget.validateFunction != null
                  ? error = widget.validateFunction!(val)
                  : error = null;
              setState(() {});

              if (widget.onSaved != null) widget.onSaved!.call(val!);
            },
            onChanged: (val) {
              widget.validateFunction != null
                  ? error = widget.validateFunction!(val)
                  : error = null;
              setState(() {});
              if (widget.onChange != null) widget.onChange!.call(val);
            },
            style: widget.textStyle ??
                context.textTheme.bodySmall?.copyWith(
                  fontSize: 12.sp,
                  color: widget.cursorColor ?? 
                  AppColors.grey6D,
                ),
            cursorColor: widget.cursorColor ??
             AppColors.grey80,
            key: widget.key,
            maxLines: widget.maxLines,
            controller: widget.controller,
            obscureText: widget.obscureText!,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            focusNode: widget.focusNode,
            onFieldSubmitted: widget.onFieldSubmitted,
            decoration: widget.decoration ??
                InputDecoration(
                  // contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  filled: false,
                  fillColor: widget.backgroundColor ?? AppColors.white,
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.suffixIcon,
                  enabled: false,
                  errorStyle: const TextStyle(fontSize: 0, height: -30),
                  hintText: widget.hintText,
                  hintStyle: widget.hintStyle ??
                      context.textTheme.bodySmall!.copyWith(
                        fontSize: 12,
                        color: AppColors.grey6D,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                      
                      color: widget.bordercolor ?? AppColors.greyE5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: widget.bordercolor ?? AppColors.greyE5,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: widget.bordercolor ?? AppColors.greyE5,
                    ),
                  ),
                ),
          ),
        ),
        if (error != null)
          SizedBox(
            height: 5.h,
          ),
        if (error != null)
          Text(
            error!,
            style: context.textTheme.bodySmall?.copyWith(
              fontSize: 14.sp,
              color: AppColors.errorText,
            ),
          ),
      ],
    );
  }
}
