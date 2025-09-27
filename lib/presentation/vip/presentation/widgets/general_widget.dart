  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskingdom/core/extensions/context_extensions.dart';
import 'package:taskingdom/core/extensions/navigation_extensions.dart';
import 'package:taskingdom/core/extensions/texttheme_extensions.dart';
import 'package:taskingdom/core/extensions/widget_extensions.dart';
import 'package:taskingdom/core/router/router.dart';
import 'package:taskingdom/core/utils/colors.dart';
import 'package:taskingdom/gen/assets.gen.dart';
import 'package:taskingdom/presentation/general_widget/app_svg.dart';

 

  Widget userDetail(Size size) {
    return Builder(
      builder: (context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center, // 50% 50%
                radius: 0.8.r, // Adjust for spread
                colors: [
                  Color(0xFF0E9982), // #0E9982 at 0%
                  Color(0xFF065548), // #065548 at 100%
                ],
                stops: [0.0, 1.0],
              ),
            borderRadius: BorderRadius.circular(8.r),
        
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                  CircleAvatar(
                  radius: 22,
                  backgroundImage: Assets.images.avatar.provider(),
                ),
                 12.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:   [
                    Text('Hi, Adewale 👋', style: context.textTheme.bodyMedium! 
                    ),
                    2.verticalSpace,
                    Text('Welcome', style:  context.textTheme.bodySmall!
                     ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
               AppSvgIcon(
                onTap: (){
                  context.pushNamed(AppRouter.notification);
                },
                path: Assets.svgs.notification,).withContainer(
                  width: 32.w,
                  height: 32.h,
                  alignment: context.center,
                       color: AppColors.green63,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                      ),
                    ],
                ),
                 12.horizontalSpace,
                
                Container(
                  padding:   EdgeInsets.symmetric(horizontal: 18.w, vertical: 9.h),
                  decoration: BoxDecoration(color: AppColors.green29, borderRadius: BorderRadius.circular(8.r)),
                  child:   Text('VIP Active', style: 
                  context.textTheme.labelSmall! 
                  ),
                )
              ],
            )
          ],
        ),
      
               33.verticalSpace, 
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text('Points Summary', style:context.textTheme.bodySmall!.copyWith(color: AppColors.white)),
                     
                    ],
                  ),
                  6.verticalSpace,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: LinearProgressIndicator(value: 0.45, minHeight: 10, backgroundColor: AppColors.white,
                     valueColor:   AlwaysStoppedAnimation(AppColors.green61)),
                  ),
                    6.verticalSpace,
                   Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:   [ 
                     AppSvgIcon(path: Assets.svgs.star) 
                      , 6.horizontalSpace, Text('80', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))])
                ],
              ).withContainer(
                boxShadow: [
                   BoxShadow(
        color: const Color(0x33000000), // #00000033 (20% opacity black)
        offset: const Offset(0, 2), // x=0, y=2
        blurRadius: 4, // blur radius
        spreadRadius: 0, // spread
      ),
                ],
                color: AppColors.green63,
                padding: EdgeInsets.all(16)
              ),
            ],
          ),
        );
      }
    );
  }

  Widget heroCard(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          // Replace with your hero image asset
          Container(
            height: 160,
            width: double.infinity,
            color: Colors.grey.shade300,
            child: Image.asset(Assets.images.herocard.path, fit: BoxFit.cover),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            right: 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:   [
                      Text('Manchester United', style: context.textTheme.labelMedium
                    ),
                      4.verticalSpace,
                      Text('defeat Villa on final day', style: 
                      context.textTheme.labelMedium
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    _iconInfo(Assets.svgs.heart
                    , '1.2k'),
                  12.horizontalSpace,
                    _iconInfo(Assets.svgs.message, '345'),
                  12.horizontalSpace,
                    _iconInfo(Assets.svgs.share, '89'),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _iconInfo(String icon, String text) {
    return Row(
      children: [
      AppSvgIcon(path: icon),
       4.horizontalSpace,
        Text(text, style: const TextStyle(color: Colors.white70)),
      ],
    );
  }

  Widget sectionTitle(String title,
  
   {String? action, VoidCallback? onTap}
   
   ) {
    return Builder(
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: context.textTheme.headlineMedium 
            ),
            if (action != null) GestureDetector(
              onTap: onTap??(){},
              child: Text(action, style:  
              context.textTheme.bodyMedium!.copyWith(color:
               AppColors.primaryColor,
               )
              ),
            )
          ],
        );
      }
    );
  }

  Widget buildCompletedTasks() {
    final tasks = [
      {'title': 'Post IG Story for Nike', 'sub': 'Jun 20 2025'},
      {'title': 'Like facebook page', 'sub': 'Jun 20 2025'},
      {'title': 'Follow our social page', 'sub': 'Jun 20 2025'},
    ];

    return Builder(
      builder: (context) {
        return Column(
          children: tasks.map((t) {
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(color: AppColors.bluef9,
               borderRadius: BorderRadius.circular(8.r), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)]),
              child: Row(
                children: [
                  const CircleAvatar(child: Icon(Icons.check, color: Colors.white), backgroundColor: 
                  AppColors.green29
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t['title']!, style: 
                        context.textTheme.labelMedium!.copyWith(
                          color: AppColors.black21
                        )
                        ),
                        6.verticalSpace,
                        Row(
                          children: [
                            AppSvgIcon(path: Assets.svgs.calendar),
                            4.horizontalSpace,
                            Text(t['sub']!, style: 
                            context.textTheme.bodySmall!.copyWith(
                              color: AppColors.grey63
                            )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6), decoration: BoxDecoration(color: AppColors.greenc5,
                   borderRadius: BorderRadius.circular(4)),
                    child:   Text('Completed', 
                    style: context.textTheme.bodySmall!.copyWith(
                      fontSize: 8,
                      color: AppColors.green29
                    )))
                ],
              ),
            );
          }).toList(),
        );
      }
    );
  }

  Widget buildAvailableTasks(Size size) {
    final items = [
      {'title': 'Share our social page', 'points': '10 points', 'date': '15/05/2025'},
      {'title': 'Watch a video', 'points': '10 points', 'date': '15/05/2025'},
      {'title': 'Post a review', 'points': '15 points', 'date': '18/05/2025'},
    ];

    return Builder(
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Available Tasks',style: context.textTheme.headlineMedium!.copyWith(
              color: AppColors.white,
            ),),
            24.verticalSpace,
            SizedBox(
              height: 210.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final it = items[index];
                  return Container(
                    width: size.width * 0.62,
                    decoration: BoxDecoration(color:   AppColors.greenDE, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                          child: Container(height: 130.h, color: 
                          AppColors.greenDE
                          , child: Image.asset(Assets.images.task.path,
                          width: size.width * 0.62,
                          height: 130.h,
                           fit: BoxFit.cover)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(it['title']!, 
                              style: 
                              context.textTheme.bodySmall!.copyWith(
                                color: AppColors.black21,
                                fontWeight: FontWeight.w600
                              )
                              ),
                             8.verticalSpace,
                                   Text('Social media', style: context.textTheme.labelSmall!.copyWith(
                                    color: AppColors.grey63,
                                     
                                   )
                                   ),
                                   8.verticalSpace,
                                  Text('10 points', style: 
                                  context.textTheme.labelSmall!.copyWith(
                                    color: AppColors.accent,
                                    )
                                  ),
                            ],
                          ),
                        )
                     
                      ],
                    ),
                  );
                },
              ),
            ),
         
          ],
        ).withContainer(
          borderRadius: BorderRadius.circular(8),
          padding: EdgeInsets.fromLTRB(12, 15, 12, 38),
          color: AppColors.green4a
        );
      }
    );
  }

  Widget buildTournamentCard(BuildContext context, String title, String host, {bool online = true}) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)]),
      child: Column(
        children: [
          // image area
          ClipRRect(
            borderRadius:   BorderRadius.vertical(top: Radius.circular(14)),
            child: Container(height: 160,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
  Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6), decoration: BoxDecoration(color: online ? AppColors.green29 : Colors.grey.shade400,), child: Text(online ? 'ONLINE' : 'UNAVAILABLE',
   style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
              ],
            ),
             decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Assets.images.pubg.provider())
            ),
            
             ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 6),
                    Text(host, style: const TextStyle(color: Colors.grey)),
                    const SizedBox(height: 6),
                    Row(children: const [Icon(Icons.emoji_events, size: 18), SizedBox(width: 6), Text('5000 points', style: TextStyle(fontWeight: FontWeight.bold))])
                  ]),
                ),
                Column(
                  children: [
                    ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), child: const Text('Join & Play')),
                    const SizedBox(height: 8),
                  
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }



