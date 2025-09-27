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
import 'package:taskingdom/presentation/vip/presentation/widgets/general_widget.dart';

 

class VipDashboard extends StatelessWidget {
  const VipDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              userDetail(size),
             16.verticalSpace,
              heroCard(context),
             20.verticalSpace,
              sectionTitle('Completed Tasks (3)', action: 'View all'),
           12.verticalSpace,
              buildCompletedTasks(),
              32.verticalSpace,
             
               buildAvailableTasks(size),
                             32.verticalSpace,
              // const SizedBox(height: 20),
              sectionTitle('Popular Tournaments', 
              action: 'Create Tournament',onTap: (){
                context.pushNamed(AppRouter.createTournamentForm);
              }),
            16.verticalSpace,
              buildTournamentCard(context, 'PUBG', 'Hosted by clanwars', online: true),
              // const SizedBox(height: 16),
              // _buildTournamentCard(context, 'Call of Duty Mobile', 'Hosted by clanwars', online: false),
              // const SizedBox(height: 16),
              // _buildTournamentCard(context, 'Clash of Clans', 'Hosted by dayk', online: true),
              // const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      
    );
  }

}