import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskingdom/core/extensions/texttheme_extensions.dart';
import 'package:taskingdom/core/extensions/widget_extensions.dart';
import 'package:taskingdom/core/utils/colors.dart';
import 'package:taskingdom/gen/assets.gen.dart';
import 'package:taskingdom/presentation/general_widget/app_bar.dart';
import 'package:taskingdom/presentation/general_widget/app_button.dart';
import 'package:taskingdom/presentation/general_widget/app_scaffold.dart';
import 'package:taskingdom/presentation/general_widget/app_svg.dart';
import 'package:taskingdom/presentation/vip/presentation/widgets/tournament_widget.dart';

class ManageTournamentScreen extends StatelessWidget {
  const ManageTournamentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
       
      appBar:CustomAppbar(
        showBackButton: true,
        screenName: 'Manage Tournamnts',
      ),
      body: Column(
        children: [
        manageTournamentCard('Tournament 1'),
 
        ],
      ),
    );
  }
}