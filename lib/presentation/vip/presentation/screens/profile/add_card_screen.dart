import 'package:flutter/material.dart';
import 'package:taskingdom/gen/assets.gen.dart';
import 'package:taskingdom/presentation/general_widget/app_bar.dart';
import 'package:taskingdom/presentation/general_widget/app_button.dart';
import 'package:taskingdom/presentation/general_widget/app_scaffold.dart';




class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar:     CustomAppbar(
      screenName: 'Add Card',
      showBackButton: false,

    ),
      body: 
Column(
  children: [

    
    AppButton(text: 'Save Card', 
    leading: Assets.svgs.formkitAdd,
    onPressed: (){

    })
  ],
)

    );
  }
}