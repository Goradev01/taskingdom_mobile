import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskingdom/core/extensions/texttheme_extensions.dart';
import 'package:taskingdom/core/utils/colors.dart';
import 'package:taskingdom/core/utils/validators.dart';
import 'package:taskingdom/presentation/general_widget/app_bar.dart';
import 'package:taskingdom/presentation/general_widget/app_button.dart';
import 'package:taskingdom/presentation/general_widget/app_dropdown.dart';
import 'package:taskingdom/presentation/general_widget/app_scaffold.dart';
import 'package:taskingdom/presentation/general_widget/app_textfield.dart';


class VipMemberSupport extends StatefulWidget {
  const VipMemberSupport({super.key});

  @override
  State<VipMemberSupport> createState() => _VipMemberSupportState();
}

class _VipMemberSupportState extends State<VipMemberSupport> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppbar(
        showBackButton: true,
        screenName: 'VIP Member Support',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Need help or have a concern? We are here for you always. As a VIP, your experience is our priority. Reach out anytime and let’s make sure your journey stays smooth, fun and rewarding',
          style: context.textTheme.bodyMedium!.copyWith(
            color: AppColors.grey63
          ),
 
          ),
                                    AppDropdown(title: 'Issue type',
                           selectedValue: 'Select an issue', onPressed: (){}),
                                    AppDropdown(title: 'Priority',
                           selectedValue: 'Select priority', onPressed: (){}),
  AppTextField(
                    label: 'Description',
                    maxLines: 4,
                              validateFunction: Validators.name(),
                              // controller: emailController,
                              hintText: 'Tell us more',
                            ),
                      40.verticalSpace,
                      AppButton(text: 'Submit',
                       onPressed: (){})

        ],
      ));
  }
}