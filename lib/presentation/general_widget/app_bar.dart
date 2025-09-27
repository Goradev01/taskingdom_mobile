
 // ignore_for_file: inference_failure_on_function_invocation

import 'package:flutter/material.dart';
import 'package:taskingdom/core/extensions/navigation_extensions.dart';
import 'package:taskingdom/core/extensions/texttheme_extensions.dart';
import 'package:taskingdom/core/utils/colors.dart';
import 'package:taskingdom/gen/assets.gen.dart';
import 'package:taskingdom/presentation/general_widget/app_svg.dart';
import 'package:taskingdom/presentation/general_widget/customizable.row.dart';

class CustomAppbar extends StatelessWidget implements 
PreferredSizeWidget {
  const CustomAppbar({
    this.showBackButton = true,
    this.screenName,
    this.title,
    this.trailing,
    this.onTap,
    this.leading,
    this.color,
    super.key,
  });

  final bool showBackButton;
  final Widget? title;
  final Widget? trailing;
  final String? leading;
final String? screenName;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        bottom: 20,
      ),
      decoration: const BoxDecoration(color: Colors.transparent,
      border: Border(bottom: BorderSide(color: AppColors.greyEE)),
      ),
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        children: [
          Expanded(
            child: CustomizableRow(
              flexValues: const [1, 5, 1],
              children: [
                switch (showBackButton == true) {
                  true => AppSvgIcon(
                      path: leading ?? Assets.svgs.back,
                      fit: BoxFit.scaleDown,
                      onTap: onTap ?? () => context.pop(),
                    ),
                  _ => const SizedBox()
                },
                Center(
                  child:
                  screenName!=null? Text(screenName!,style: context.textTheme.headlineLarge,):
                   title ?? const SizedBox(),
                ),
                trailing ?? const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static final _appBar = AppBar();

  @override
  Size get preferredSize => _appBar.preferredSize;
}
