 
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskingdom/core/extensions/texttheme_extensions.dart';
import 'package:taskingdom/core/utils/colors.dart';
import 'package:taskingdom/gen/assets.gen.dart';
import 'package:taskingdom/presentation/general_widget/app_svg.dart';

class NavBar extends ConsumerWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = [
      {
        'icon': Assets.svgs.homenav,
        'inactive': Assets.svgs.homenavInactive,
        'name': 'Home'
      },
      {
        'icon': Assets.svgs.gamenav,
        'inactive': Assets.svgs.gamenavInactive,
        'name': 'Tournaments'
      },
      {
        'icon': Assets.svgs.profilenav,
        'inactive': Assets.svgs.profilenavInactive,
        'name': 'Profile'
      },
 
    ];
    final v = ref.watch(currentIndexProvider);
    return Container(
      padding: EdgeInsets.fromLTRB(23.w, 17.h, 23.w, 25.h),
      color: AppColors.white,
      width: double.infinity,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            items.length,
            (index) => InkWell(
              onTap: () {
                ref.read(currentIndexProvider.notifier).state = index;
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                transform: Matrix4.identity()..scale(index == v ? 1.0 : 1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppSvgIcon(
                      path: index == v
                          ? '${items[index]['icon']}'
                          : '${items[index]['inactive']}',
                      width: 24.w,
                      height: 24.h,
                     
                      fit: BoxFit.scaleDown,
                    ),
                    6.verticalSpace,
                    Text(
                      '${items[index]['name']}',
                      style: context.textTheme.headlineSmall!.copyWith(
                
                         color: index == v
                          ? AppColors.primaryColor
                          : AppColors.grey90,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final currentIndexProvider = StateProvider.autoDispose<int>((ref) => 0);
