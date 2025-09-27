import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskingdom/core/extensions/texttheme_extensions.dart';
import 'package:taskingdom/core/utils/colors.dart';
import 'package:taskingdom/core/utils/enums.dart';
import 'package:taskingdom/gen/assets.gen.dart';
import 'package:taskingdom/presentation/general_widget/app_bar.dart';
import 'package:taskingdom/presentation/general_widget/app_scaffold.dart';

class TaskItem {
  final String title;
  final String date;
  final TaskFilter status;
  final int points;
  TaskItem({required this.title, required this.date, required this.status, this.points = 0});
}

class TaskProgressScreen extends StatefulWidget {
  const TaskProgressScreen({super.key});

  @override
  State<TaskProgressScreen> createState() => _TaskProgressScreenState();
}

class _TaskProgressScreenState extends State<TaskProgressScreen> {
  TaskFilter _filter = TaskFilter.all;

  final List<TaskItem> _tasks = [
    TaskItem(title: 'Article Reading', date: '15.05.2025', status: TaskFilter.inprogress, points: 0),
    TaskItem(title: 'Completing a Survey', date: '15.05.2025', status: TaskFilter.completed, points: 50),
    TaskItem(title: 'Cannon Balls 3D', date: '15.05.2025', status: TaskFilter.pending, points: 500),
    TaskItem(title: 'Cannon Balls 3D', date: '15.05.2025', status: TaskFilter.pending, points: 500),
  ];

  List<TaskItem> get _filteredTasks {
    if (_filter == TaskFilter.all) return _tasks;
    return _tasks.where((t) => t.status == _filter).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppbar(screenName: 'Tasks Progress', showBackButton: true),
      body: Column(
        children: [
          _buildFilterRow(),
          36.verticalSpace,
          Expanded(
            child: _filteredTasks.isEmpty
                ? Center(child: Text('No tasks found', style: context.textTheme.bodyMedium!.copyWith(color: AppColors.grey6D)))
                : ListView.separated(
                    itemCount: _filteredTasks.length,
                    separatorBuilder: (_, __) => 12.verticalSpace,
                    itemBuilder: (_, idx) => _taskCard(_filteredTasks[idx]),
                  ),
          )
        ],
      ),
    );
  }

  Widget _buildFilterRow() {
    return SizedBox(
      height: 36.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _filterChip(TaskFilter.all, label: 'All'),
          8.horizontalSpace,
          _filterChip(TaskFilter.inprogress, label: 'Inprogress'),
          8.horizontalSpace,
          _filterChip(TaskFilter.completed, label: 'Completed'),
          8.horizontalSpace,
          _filterChip(TaskFilter.pending, label: 'Pending'),
        ],
      ),
    );
  }

  Widget _filterChip(TaskFilter value, {required String label}) {
    final bool selected = _filter == value;
    return GestureDetector(
      onTap: () => setState(() => _filter = value),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.activeRed : Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: selected ? AppColors.activeRed : AppColors.greyE5),
        ),
        child: Text(label, style: context.textTheme.bodyMedium!.copyWith(color: selected ? AppColors.accent : AppColors.grey63)),
      ),
    );
  }

  Widget _taskCard(TaskItem task) {
    Color badgeBg;
    Color badgeText;
    String badgeLabel;
    switch (task.status) {
      case TaskFilter.completed:
        badgeBg = AppColors.green29;
        badgeText = AppColors.greenc5;
        badgeLabel = 'Completed';
        break;
      case TaskFilter.inprogress:
        badgeBg = Color(0xFFB1C5F6);
        badgeText = Color(0xFF1A53E2);
        badgeLabel = 'In progress';
        break;
      case TaskFilter.pending:
        badgeBg = AppColors.yellowBE;
        badgeText = AppColors.yellow06;
        badgeLabel = 'Pending';
        break;
      default:
        badgeBg = Color(0xFFEFEFEF);
        badgeText = Color(0xFF333333);
        badgeLabel = 'Unknown';
    }

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Color(0xffF3F4F6),
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 6.r, offset: Offset(0, 2.h))],
        border: Border.all(color: AppColors.greyE5),
      ),
      child: Row(
        children: [
          // thumbnail placeholder
 Assets.images.taskprogess.image(),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.title, 
                style: context.textTheme.labelMedium!.copyWith(
                  color: AppColors.black
                ),
                ),
                6.verticalSpace,
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 12.sp, color: AppColors.green29),
                    6.horizontalSpace,
                    Text(task.date, style: TextStyle(fontSize: 10.sp, color: AppColors.green29)),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (task.points > 0)
                Row(
                  children: [
                    Icon(Icons.emoji_events, size: 14.sp, color: Color(0xFFFFB84D)),
                    6.horizontalSpace,
                    Text('${task.points} points', style: TextStyle(fontSize: 8.sp, color: AppColors.grey63)),
                  ],
                ),
              8.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(color: badgeBg, borderRadius: BorderRadius.circular(8.r)),
                child: Text(badgeLabel, style: TextStyle(color: badgeText, fontSize: 11.sp, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}