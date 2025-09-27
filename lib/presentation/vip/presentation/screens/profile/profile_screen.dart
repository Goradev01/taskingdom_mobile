import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskingdom/core/extensions/context_extensions.dart';
import 'package:taskingdom/core/extensions/navigation_extensions.dart';
import 'package:taskingdom/core/router/router.dart';
import 'package:taskingdom/core/utils/colors.dart';
import 'package:taskingdom/gen/assets.gen.dart';
import 'package:taskingdom/presentation/general_widget/app_scaffold.dart';
import 'package:taskingdom/presentation/general_widget/app_svg.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER + STATS (unchanged layout, keeps overlap)
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: context.width,
                  padding: EdgeInsets.only(top: 120.h, bottom: 50.h),
                  decoration: BoxDecoration(color: Color(0xffC2FAED)),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: Assets.images.avatar.provider(),
                      ),
                      16.verticalSpace,
                      Text(
                        'Adewale Chukwuma ',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      4.verticalSpace,
                      Text(
                        'chuks@gmail.com',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.grey63),
                      ),
                    ],
                  ),
                ),

                // stats card positioned to overlap the header (matches the design)
                Positioned(
                  left: 10.w,
                  right: 10.w,
                  top: 260.h,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        center: Alignment.center,
                        radius: 1.85,
                        colors: [
                          Color(0xFF813154),
                          Color(0xFF350D1F),
                        ],
                        stops: [0.0, 1.0],
                      ),
                      borderRadius: BorderRadius.circular(14.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 8.r,
                          offset: Offset(0, 4.h),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                            child: _statItem(
                          context,
                          icon: Assets.svgs.taskcomplete,
                          value: '12',
                          label: 'Task completed',
                        )),
                        _verticalDivider(),
                        Expanded(
                            child: _statItem(
                          context,
                          icon: Assets.svgs.totalpoint,
                          value: '2430',
                          label: 'Total points',
                        )),
                        _verticalDivider(),
                        Expanded(
                            child: _statItem(
                          context,
                          icon: Assets.svgs.trophy,
                          value: '100',
                          label: 'Tournaments',
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // space to account for the overlapping card
            SizedBox(height: 90.h),

            // CONTENT CARDS
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  _sectionCard(context, [
                    _tile(context, icon: Icons.person_outline, label: 'Edit Profile',
                    onTap: (){
                      context.pushNamed(AppRouter.editProfileScreen);
                    }
                    ),
                    _tile(context, 
                    onTap: (){
                                   context.pushNamed(AppRouter.transactionHistoryScreen);
                    },
                    icon: Icons.receipt_long, label: 'Transaction History'),
                    _tile(context,
                       onTap: (){
                      context.pushNamed(AppRouter.taskProgressScreen);
                    },
                     icon: Icons.task_alt_outlined, label: 'Tasks Progress'),
                    _tile(context,
                        icon: Icons.credit_card_outlined,
                        label: 'Bank Card',
                                               onTap: (){
                      context.pushNamed(AppRouter.linkedCardScreen);
                    },
                        trailingText: 'Linked card',
                        trailingColor: Color(0xFFD63B6E)),
                  ],),

                  12.verticalSpace,

                  _sectionCard(context, [
                    _tile(context, icon: Icons.emoji_events_outlined,
                                           onTap: (){
                      context.pushNamed(AppRouter.manageTournament);
                    },
                     label: 'Manage Tournaments'),
                    _tile(context, 
                                           onTap: (){
                      context.pushNamed(AppRouter.subscrptionManagement);
                    },
                    icon: Icons.subscriptions_outlined,
                    
                     label: 'Subscription Management'),
                    _tile(context, 
                                           onTap: (){
                      context.pushNamed(AppRouter.notification);
                    },
                    icon: Icons.notifications_outlined, label: 'Notifications'),
                    _tile(context, icon: Icons.share_outlined,
                    
                     label: 'Connect Socials',onTap: (){
                      context.pushNamed(AppRouter.connectSocialScreen);
                    }),
                  ],),

                  12.verticalSpace,

                  _sectionCard(context, [
                    _tile(context, icon: Icons.headset_mic_outlined,
                                           onTap: (){
                      context.pushNamed(AppRouter.vipMemberSupport);
                    },
                     label: 'VIP Member Support'),
                    _tile(context, icon: Icons.description_outlined, label: 'Terms & Conditions'),
                  ]),

                  20.verticalSpace,

                  // Logout button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // TODO: hook logout action
                      },
                      icon: Icon(Icons.logout, color: Color(0xFFD63B6E)),
                      label: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Text(
                          'Log Out',
                          style: TextStyle(color: Color(0xFFD63B6E)),
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Color(0xFFFFD9E0)),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                      ),
                    ),
                  ),

                  24.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _verticalDivider() {
    return Container(
      height: 48.h,
      width: 1.w,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      color: Colors.white,
    );
  }

  Widget _statItem(BuildContext context, {required String icon, required String value, required String label}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppSvgIcon(path: icon),
            8.horizontalSpace,
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
        4.verticalSpace,
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.greyE5,
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }

  Widget _sectionCard(BuildContext context, List<Widget> tiles) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 6.r, offset: Offset(0, 2.h)),
        ],
        border: Border.all(color: Color(0xFFEFEFEF)),
      ),
      child: Column(
        children: List.generate(tiles.length * 2 - 1, (index) {
          if (index.isEven) return tiles[index ~/ 2];
          return Divider(height: 1.h, thickness: 1.h, color: Color(0xFFF2F2F2));
        }),
      ),
    );
  }

  Widget _tile(BuildContext context, {
   
    required IconData icon, required String label, String? trailingText, Color? trailingColor,  VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Color(0xFFF7F7F8),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(icon, size: 20.sp, color: AppColors.grey63),
            ),
            12.horizontalSpace,
            Expanded(
              child: Text(
                label,
                style: TextStyle(fontSize: 12, color: AppColors.grey63),
              ),
            ),
            if (trailingText != null)
              Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: Text(trailingText, style: TextStyle(color: trailingColor ?? AppColors.grey63, fontSize: 12.sp)),
              ),
            Icon(Icons.chevron_right, color: Color(0xFFBDBDBD)),
          ],
        ),
      ),
    );
  }
}