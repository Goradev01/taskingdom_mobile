import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskingdom/core/extensions/texttheme_extensions.dart';
import 'package:taskingdom/core/extensions/widget_extensions.dart';
import 'package:taskingdom/core/utils/colors.dart';
import 'package:taskingdom/gen/assets.gen.dart';
import 'package:taskingdom/presentation/general_widget/app_bar.dart';
import 'package:taskingdom/presentation/general_widget/app_svg.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppbar(
        showBackButton: true,
        title: Text('Notifications',style: context.textTheme.headlineLarge,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
        AppSvgIcon(path: Assets.svgs.vip),
        8.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                          Text('VIP Status Update',style: context.textTheme.bodyLarge,),
                          
                          Text('Your VIP membership is now active. Enjoy increased rewards and tournament access.',style: context.textTheme.bodyMedium!.copyWith(
                            color: AppColors.grey63
                          ),),
                          4.verticalSpace,
                          Text('May 5, 7:30AM',style: context.textTheme.bodyMedium!.copyWith(
                            color: AppColors.grey63
                          ),),
                    ],
                  ),
                )
              ],
            ).withContainer(
              borderRadius: BorderRadius.circular(8),
              padding: EdgeInsets.symmetric(horizontal: 22,vertical: 18),
              color: Color(0xffFDE8EF)
            )
          
          ],
        ),
      ),
    );
  }
}