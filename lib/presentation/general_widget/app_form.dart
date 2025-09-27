// ignore_for_file: prefer_asserts_with_message
 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskingdom/core/extensions/widget_extensions.dart';
import 'package:taskingdom/core/utils/colors.dart';
import 'package:taskingdom/presentation/general_widget/app_button.dart';

class AppForm extends StatefulWidget {
  const AppForm({
    required this.children,
    required this.isActive,
    required this.formKey,
    required this.onPressed,
    required this.buttonText,
    this.isExpanded = true,
    this.extraWidget,
    super.key, this.isLoading,
  });
  final List<Widget> children;
  final VoidCallback onPressed;
  final bool? isLoading;
  final String buttonText;
  final bool isActive;
  final Widget? extraWidget;
  final bool? isExpanded;

  final GlobalKey<FormState> formKey;

  @override
  State<AppForm> createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: widget.formKey,
        child: Column(
          mainAxisSize: widget.isExpanded! ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: widget.isExpanded!
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.start,
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(widget.children.length, (index) {
                    return widget.children[index].withContainer(
                      padding: EdgeInsets.only(bottom: 28.h),
                    );
                  }),
                ),
              ),
            ),
            widget.extraWidget ?? const SizedBox(),
            32.verticalSpace,
            Opacity(
              opacity: widget.isActive ? 1 : 0.5,
              child: AppButton(
                isLoading: widget.isLoading??false,
                color: AppColors.primaryColor,
                text: widget.buttonText,
                onPressed: () {
                  widget.onPressed();
                  widget.formKey.currentState!.validate();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
