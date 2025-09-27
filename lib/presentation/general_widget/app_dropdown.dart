 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskingdom/core/extensions/string_extensions.dart';
import 'package:taskingdom/core/extensions/texttheme_extensions.dart';
import 'package:taskingdom/core/extensions/widget_extensions.dart';
import 'package:taskingdom/core/utils/colors.dart';
import 'package:taskingdom/gen/assets.gen.dart';
import 'package:taskingdom/presentation/general_widget/app_svg.dart';

class AppDropdown extends StatefulWidget {
  final String title;
 final String? selectedValue;
  final VoidCallback onPressed;
  const AppDropdown({
    super.key,
    required this.title,
    required this.selectedValue,
    required this.onPressed,
   
  });

  @override
  State<AppDropdown> createState() =>
      _AppDatePickerWidgetState();
}

class _AppDatePickerWidgetState extends State<AppDropdown> {
 
  @override
  Widget build(BuildContext context) {
 
    return GestureDetector(
      onTap: widget.onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
            Text(widget.title,style: context.textTheme.bodyMedium!.copyWith(
          color: AppColors.black21
        ),),
        8.verticalSpace,
         
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               
 
              Text(
               widget.selectedValue??'Select',
                style: context.textTheme.bodySmall!.copyWith(
                  color: AppColors.grey6D,
                ),
              ),
              AppSvgIcon(path: Assets.svgs.arrowDown),
            ],
          ).withContainer(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1,color: AppColors.greyE5),
            padding: const EdgeInsets.all(15),
           
          ),
        ],
      ),
    );
  }
}
