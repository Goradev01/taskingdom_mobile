import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskingdom/core/extensions/texttheme_extensions.dart';
import 'package:taskingdom/core/utils/colors.dart';
import 'package:taskingdom/presentation/general_widget/app_bar.dart';
import 'package:taskingdom/presentation/general_widget/app_scaffold.dart';

enum TxStatus { successful, failed, pending }

class Transaction {
  final String title;
  final String date;
  final double amount;
  final bool isCredit;
  final TxStatus status;
  final IconData icon;
  Transaction({
    required this.title,
    required this.date,
    required this.amount,
    this.isCredit = false,
    required this.status,
    required this.icon,
  });
}

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  TxFilter _filter = TxFilter.all;

  final List<Transaction> _transactions = [
    Transaction(
      title: 'Withdrawal request',
      date: 'May 24th, 18:00',
      amount: 500.00,
      isCredit: false,
      status: TxStatus.pending,
      icon: Icons.swap_vert,
    ),
    Transaction(
      title: 'Transfer to bank',
      date: 'May 24th, 18:00',
      amount: 500.00,
      isCredit: true,
      status: TxStatus.successful,
      icon: Icons.arrow_upward,
    ),
    Transaction(
      title: 'Withdrawal request',
      date: 'May 24th, 18:00',
      amount: 500.00,
      isCredit: false,
      status: TxStatus.failed,
      icon: Icons.account_balance_wallet,
    ),
    Transaction(
      title: 'Withdrawal request',
      date: 'May 24th, 18:00',
      amount: 500.00,
      isCredit: false,
      status: TxStatus.pending,
      icon: Icons.swap_horiz,
    ),
  ];

  List<Transaction> get _filtered {
    if (_filter == TxFilter.all) return _transactions;
    if (_filter == TxFilter.successful) {
      return _transactions.where((t) => t.status == TxStatus.successful).toList();
    }
    if (_filter == TxFilter.failed) {
      return _transactions.where((t) => t.status == TxStatus.failed).toList();
    }
    return _transactions.where((t) => t.status == TxStatus.pending).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppbar(
        showBackButton: true,
        screenName: 'Transaction History',
      ),
      body: Column(
        children: [
          _buildFilterRow(),
          32.verticalSpace,
          Expanded(
            child: _filtered.isEmpty
                ? Center(
                    child: Text('No transactions', style: TextStyle(color: AppColors.grey6D)),
                  )
                : ListView.separated(
                    itemCount: _filtered.length,
                    separatorBuilder: (_, __) => 12.verticalSpace,
                    itemBuilder: (_, idx) => _txCard(_filtered[idx]),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterRow() {
    return SizedBox(
      height: 32.h,

      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _filterChip('All', TxFilter.all),
          8.horizontalSpace,
          _filterChip('Successful', TxFilter.successful),
          8.horizontalSpace,
          _filterChip('Failed', TxFilter.failed),
          8.horizontalSpace,
          _filterChip('Pending', TxFilter.pending),
        ],
      ),
    );
  }

  Widget _filterChip(String label, TxFilter value) {
    final bool selected = _filter == value;
    return GestureDetector(
      onTap: () => setState(() => _filter = value),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 18.w, 
        vertical: 5.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.activeRed : Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: selected ? AppColors.activeRed :
           AppColors.greyE5),
        ),
        child:
        Text(label,style: context.textTheme.bodyMedium!.copyWith(
          color: selected ? AppColors.accent 
            : AppColors.grey63
        ),),
 
      ),
    );
  }

  Widget _txCard(Transaction tx) {
    Color badgeColor;
    Color badgeTextColor;
    String badgeText;
    switch (tx.status) {
      case TxStatus.successful:
        badgeColor = AppColors.greenc5;
        badgeTextColor = AppColors.green29;
        badgeText = 'Successful';
        break;
      case TxStatus.pending:
        badgeColor = AppColors.yellowBE;
        badgeTextColor = AppColors.yellow06;
        badgeText = 'Pending';
        break;
      case TxStatus.pending:
      default:
        badgeColor = AppColors.redCC;
        badgeTextColor = AppColors.redE4;
        badgeText = 'Failed';
        break;
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
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(color: AppColors.greenB3,
             borderRadius: BorderRadius.circular(20.r)),
            child: Icon(tx.icon, color: AppColors.white, size: 20.sp),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tx.title, style: 
                context.textTheme.bodyMedium!.copyWith(
                  color: AppColors.black21
                )
                ),
                6.verticalSpace,
                Text(tx.date, style: 
                  context.textTheme.bodySmall!.copyWith(
                  color: AppColors.grey63,
                  fontWeight: FontWeight.w400,
                )
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${tx.isCredit ? '+' : '-'}₦${tx.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.black21,
                  fontSize: 14.sp,
                ),
              ),
              8.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(color: badgeColor, borderRadius: BorderRadius.circular(8.r)),
                child: Text(badgeText, style: context.textTheme.bodySmall!.copyWith(
                  color: badgeTextColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum TxFilter { all, successful, failed, pending }