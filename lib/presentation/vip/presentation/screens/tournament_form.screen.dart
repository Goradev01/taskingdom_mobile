import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskingdom/core/extensions/texttheme_extensions.dart';
import 'package:taskingdom/core/extensions/widget_extensions.dart';
import 'package:taskingdom/core/utils/colors.dart';
import 'package:taskingdom/core/utils/enums.dart';
import 'package:taskingdom/core/utils/validators.dart';
import 'package:taskingdom/gen/assets.gen.dart';
import 'package:taskingdom/presentation/general_widget/app_bar.dart';
import 'package:taskingdom/presentation/general_widget/app_date_picker_widget.dart';
import 'package:taskingdom/presentation/general_widget/app_dropdown.dart';
import 'package:taskingdom/presentation/general_widget/app_form.dart';
import 'package:taskingdom/presentation/general_widget/app_scaffold.dart';
import 'package:taskingdom/presentation/general_widget/app_svg.dart';
import 'package:taskingdom/presentation/general_widget/app_textfield.dart';

class TournamentFormScreen extends StatefulWidget {
 final FormType formType;
  const TournamentFormScreen({super.key, required this.formType});

  @override
  State<TournamentFormScreen> createState() => _TournamentFormScreenState();
}

class _TournamentFormScreenState extends State<TournamentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppbar(
        showBackButton: true,
      screenName: widget.formType.title,
      ),
      body: 
      AppForm(isActive: true, formKey: _formKey, onPressed: (){},
        buttonText:  widget.formType.title, children: [
            Visibility(
              visible: widget.formType.isCreate,
              child: Column(
                children: [
                  AppTextField(
                    label: 'Tournament name',
                              validateFunction: Validators.name(),
                              // controller: emailController,
                              hintText: 'Enter Tournament Name',
                            ),
                          
                          AppDropdown(title: 'Game',
                           selectedValue: 'Pick Game', onPressed: (){}),
                ],
              ),
            ),  
                 Visibility(
                  visible: widget.formType.isUpdate,
                   child: AppTextField(
                    maxLines: 5,
                                 label: 'Update rules',
                          validateFunction: Validators.name(),
                          // controller: emailController,
                          hintText: 'Enter new set of rules',
                        ),
                 ),
                  Row(
                    children: List.generate(2, (index)=>Expanded(child: Column(
                      children: [
                        Text(
                          index==0?
                          'Reward Amount':'Number of participants',style: context.textTheme.bodySmall!.copyWith(
                          color: AppColors.grey6D
                        ),),
                        4.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppSvgIcon(path: index ==0? Assets.svgs.trophy:Assets.svgs.fluentPeopleStar32Filled),
                             2.horizontalSpace,
                              Text('000',style: context.textTheme.bodySmall!.copyWith(
                          color: AppColors.grey6D,
                          fontSize: 14,
                        ),),
                          ],
                        )
                      ],
                    ).withContainer(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(right: 10),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1,color: AppColors.greyE5),
                    )
                    
                    )),
                  ),
              AppDatePickerWidget(title: 'Start date',
               onPressed: (){}, arrivalDate: DateTime(2025)),
              AppDatePickerWidget(title: 'End date',
               onPressed: (){}, arrivalDate: DateTime(2025)),
               
                 Visibility(
                  visible: widget.formType.isCreate,
                   child: AppTextField(
                    maxLines: 5,
                                 label: 'Set rules',
                          validateFunction: Validators.name(),
                          // controller: emailController,
                          hintText: 'Enter rules',
                        ),
                 ),
                     
                     
                              AppTextField(
              label: 'Invite players',
                        validateFunction: Validators.name(),
                        // controller: emailController,
                        hintText: 'Search player',
                      ),
          
      ])
      );
  }
}