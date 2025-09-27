import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskingdom/core/extensions/context_extensions.dart';
import 'package:taskingdom/core/utils/validators.dart';
import 'package:taskingdom/gen/assets.gen.dart';
import 'package:taskingdom/presentation/general_widget/app_bar.dart';
import 'package:taskingdom/presentation/general_widget/app_form.dart';
import 'package:taskingdom/presentation/general_widget/app_scaffold.dart';
import 'package:taskingdom/presentation/general_widget/app_svg.dart';
import 'package:taskingdom/presentation/general_widget/app_textfield.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
    final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppbar(
        screenName: 'Edit Profile',
        showBackButton: true,
      ),
      body: AppForm(isExpanded: false,
       isActive: true, formKey: _formKey, onPressed: (){
       }, buttonText: 'Save', children: [
 Container(
  height: 80.h,width: 80.w,
  alignment: context.center,
  decoration: BoxDecoration(

    image: DecorationImage(image: Assets.images.avatar.provider())
  ),
  child:AppSvgIcon(path: Assets.svgs.camera) ,
 ),
 44.verticalSpace,
                               AppTextField(
              label: 'Username',
                        validateFunction: Validators.name(),
                        // controller: emailController,
                        hintText: '',
                      ),
                               AppTextField(
              label: 'Email',
                        validateFunction: Validators.name(),
                        // controller: emailController,
                        hintText: '',
                      ),
                               AppTextField(
              label: 'Phone number',
                        validateFunction: Validators.name(),
                        // controller: emailController,
                        hintText: '',
                      ),

      ])
    );
  }
}