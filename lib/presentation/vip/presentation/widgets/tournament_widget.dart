

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskingdom/core/extensions/context_extensions.dart';
import 'package:taskingdom/core/extensions/navigation_extensions.dart';
import 'package:taskingdom/core/extensions/texttheme_extensions.dart';
import 'package:taskingdom/core/extensions/widget_extensions.dart';
import 'package:taskingdom/core/router/router.dart';
import 'package:taskingdom/core/utils/colors.dart';
import 'package:taskingdom/gen/assets.gen.dart';
import 'package:taskingdom/presentation/general_widget/app_button.dart';
import 'package:taskingdom/presentation/general_widget/app_svg.dart';

Widget manageTournamentCard(String title){
  return Builder(
    builder: (context) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: context.textTheme.bodyMedium!.copyWith(
            color: AppColors.black
          ),),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text('In progress',style: context.textTheme.bodyMedium!.copyWith(
            color: AppColors.blue1A,
            fontSize: 8
          ),).withContainer(
            alignment: context.center,
            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 3),
            borderRadius: BorderRadius.circular(4),
            color: Color(0xffB1C5F6)
          ),
          16.verticalSpace,
          
          Row(
            children: [
                GestureDetector(
                  onTap: (){
                    context.pushNamed(AppRouter.updateTournamentForm);
                  },
                  child: Text('Edit',style: context.textTheme.bodyMedium!.copyWith(
                              color: AppColors.white,
                              fontSize: 8
                            ),).withContainer(
                              alignment: context.center,
                              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 7),
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.primaryColor
                            ),
                ),
          12.horizontalSpace,
          AppSvgIcon(path: Assets.svgs.delete)
            ],
          )
            ],
          )
      
        ],
      )
      .withContainer(
        boxShadow: [
           BoxShadow(
        color: Color(0x66000000), // #00000040 -> 40 hex = 25% opacity
        offset: Offset(0, 2),     // x=0px, y=2px
        blurRadius: 4,            // blur of 4px
        spreadRadius: 0,          // spread of 0px
      ),
        ],
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        borderRadius: BorderRadius.circular(8),
        color: Color(0xffE8F9F4)
      );
    }
  );
}