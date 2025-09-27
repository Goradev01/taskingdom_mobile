import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskingdom/core/extensions/texttheme_extensions.dart';
import 'package:taskingdom/core/utils/colors.dart';
import 'package:taskingdom/presentation/general_widget/app_bar.dart';
import 'package:taskingdom/presentation/general_widget/app_scaffold.dart';

class ConnectSocialScreen extends StatelessWidget {
  const ConnectSocialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppbar(
        showBackButton: true,
        screenName: 'Connect Socials',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text('Link your social accounts',style: context.textTheme.labelMedium!.copyWith(
        color: AppColors.grey6D
      ),),
          _socialTile(
            context,
            leading: _brandIcon(Colors.pink.shade200, Icons.camera_alt, Colors.deepOrange),
            label: 'Instagram',
            onTap: () {
              // TODO: connect Instagram
            },
          ),
          12.verticalSpace,
          _socialTile(
            context,
            leading: _brandIcon(Colors.black, Icons.close, Colors.white),
            label: 'X',
            onTap: () {
              // TODO: connect X
            },
          ),
          12.verticalSpace,
          _socialTile(
            context,
            leading: _brandIcon(Colors.blue.shade50, Icons.facebook, Colors.blue),
            label: 'Facebook',
            onTap: () {
              // TODO: connect Facebook
            },
          ),
          12.verticalSpace,
          _socialTile(
            context,
            leading: _brandIcon(Colors.red.shade50, Icons.play_circle_fill, Colors.red),
            label: 'YouTube',
            onTap: () {
              // TODO: connect YouTube
            },
          ),
        ],
      ),
    );
  }

  Widget _brandIcon(Color bg, IconData icon, Color iconColor) {
    return Container(
      width: 44.w,
      height: 44.w,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(
        child: Icon(icon, color: iconColor, size: 20.sp),
      ),
    );
  }

  Widget _socialTile(BuildContext context,
      {required Widget leading, required String label, VoidCallback? onTap}) {
    return Material(
      color: Color(0xFFFAEBE6),
      borderRadius: BorderRadius.circular(8.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.r),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1, vertical: 14.h),
          child: Row(
            children: [
              leading,
              12.horizontalSpace,
              Expanded(
                child: Text(label, style: TextStyle(fontSize: 14.sp, color: Color(0xFF333333))),
              ),
              Icon(Icons.chevron_right, color: Color(0xFFBDBDBD)),
            ],
          ),
        ),
      ),
    );
  }
}