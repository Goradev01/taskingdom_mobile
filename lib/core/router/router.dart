
import 'package:flutter/material.dart';
import 'package:taskingdom/core/utils/enums.dart';
import 'package:taskingdom/presentation/vip/presentation/screens/manage_tournament_screen.dart';
import 'package:taskingdom/presentation/vip/presentation/screens/notification_screen.dart';
import 'package:taskingdom/presentation/vip/presentation/screens/profile/add_card_screen.dart';
import 'package:taskingdom/presentation/vip/presentation/screens/profile/connect_socials.dart';
import 'package:taskingdom/presentation/vip/presentation/screens/profile/edit_profile_screen.dart';
import 'package:taskingdom/presentation/vip/presentation/screens/profile/linked_card_screen.dart';
import 'package:taskingdom/presentation/vip/presentation/screens/profile/profile_screen.dart';
import 'package:taskingdom/presentation/vip/presentation/screens/profile/subscrption_management.dart';
import 'package:taskingdom/presentation/vip/presentation/screens/profile/task_progress_screen.dart';
import 'package:taskingdom/presentation/vip/presentation/screens/profile/transaction_history_screen.dart';
import 'package:taskingdom/presentation/vip/presentation/screens/profile/vip_member_support.dart';
import 'package:taskingdom/presentation/vip/presentation/screens/tournament_form.screen.dart';

class AppRouter{
  static const String notification = '/notification';
  static const String manageTournament = '/manageTournament';
  static const String updateTournamentForm = '/updateTournamentForm';
  static const String createTournamentForm = '/createTournamentForm';
  static const String profileScreen = '/profileScreen';
  static const String connectSocialScreen = '/connectSocialScreen';
  static const String editProfileScreen = '/editProfileScreen';
  static const String transactionHistoryScreen = '/transactionHistoryScreen';
  static const String taskProgressScreen = '/taskProgressScreen';
  static const String subscrptionManagement = '/subscrptionManagement';
  static const String vipMemberSupport = '/vipMemberSupport';
  static const String linkedCardScreen = '/linkedCardScreen';
  static const String addCardScreen = '/addCardScreen';

  static final Map<String,Widget Function(BuildContext)> _routes ={
    notification:(context)=>const NotificationScreen(),
    manageTournament:(context)=>const ManageTournamentScreen(),
    profileScreen:(context)=>const ProfileScreen(),
    connectSocialScreen:(context)=>const ConnectSocialScreen(),
    updateTournamentForm:(context)=>const TournamentFormScreen(formType: FormType.update,),
    createTournamentForm:(context)=>const TournamentFormScreen(formType: FormType.create,),
    editProfileScreen:(context)=>const EditProfileScreen(),
    transactionHistoryScreen:(context)=>const TransactionHistoryScreen(),
    taskProgressScreen:(context)=>const TaskProgressScreen(),
    subscrptionManagement:(context)=>const SubscrptionManagement(),
    linkedCardScreen:(context)=>const LinkedCardScreen(),
    vipMemberSupport:(context)=>const VipMemberSupport(),
    addCardScreen:(context)=>const AddCardScreen(),

  };
  static Map<String,Widget Function(BuildContext)> get routes => _routes;

}
