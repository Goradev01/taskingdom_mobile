import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskingdom/core/extensions/context_extensions.dart';
import 'package:taskingdom/core/extensions/navigation_extensions.dart';
import 'package:taskingdom/core/extensions/texttheme_extensions.dart';
import 'package:taskingdom/core/router/router.dart';
import 'package:taskingdom/core/utils/colors.dart';
import 'package:taskingdom/presentation/general_widget/app_scaffold.dart';
import 'package:taskingdom/presentation/vip/presentation/widgets/general_widget.dart';


class TournamentScreen extends StatefulWidget {
  const TournamentScreen({super.key});

  @override
  State<TournamentScreen> createState() => _TournamentScreenState();
}

class _TournamentScreenState extends State<TournamentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,
           vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.verticalSpace,
              Center(
                child: Text(
                  'Tournaments',
                  style: context.textTheme.headlineLarge,
                ),
              ),
              32.verticalSpace,
              Container(
                height: 40.h,
                alignment: context.center,
                decoration: BoxDecoration(
                  color: Color(0xffF4F4F4),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color:
                  Color(0xffE5E5E5)
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey[500]),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          // hintText: 'Search',
                          hintStyle: context.textTheme.bodySmall!.copyWith(
                            fontSize: 12,
                            color: AppColors.grey6D
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  // All button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFBD0E0),
                      // foregroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    ),
                    child:   Text('All',style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.accent
                    ),),
                  ),
                  8.horizontalSpace,
                  // My Tournaments button
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Color(0xFFE0E0E0)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    ),
                    child:   Text('My Tournaments',style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.grey63
                    ),),
                  ),
                  const Spacer(),
                  // Manage Tournaments button
                  ElevatedButton(
                    onPressed: () {
                      context.pushNamed(AppRouter.manageTournament);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE86A33),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10, 
                      vertical: 11),
                    ),
                    child:  Text(
                      'Manage Tournaments',
                      style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.white
                    ), 
                    ),
                  ),
                ],
              ),
               16.verticalSpace,
              buildTournamentCard(context, 'PUBG', 'Hosted by clanwars', online: true),
            ],
          ),
        ),
      ),
    );
  }
}