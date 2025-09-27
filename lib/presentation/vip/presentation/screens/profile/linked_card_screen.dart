import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskingdom/gen/assets.gen.dart';
import 'package:taskingdom/presentation/general_widget/app_bar.dart';
import 'package:taskingdom/presentation/general_widget/app_button.dart';
import 'package:taskingdom/presentation/general_widget/app_scaffold.dart';

class CardItem {
  final String brandLabel;
  final String maskedNumber;
  CardItem({required this.brandLabel, required this.maskedNumber});
}

class LinkedCardScreen extends StatefulWidget {
  const LinkedCardScreen({super.key});

  @override
  State<LinkedCardScreen> createState() => _LinkedCardScreenState();
}

class _LinkedCardScreenState extends State<LinkedCardScreen> {
  final List<CardItem> _cards = [
    CardItem(brandLabel: 'Mastercard', maskedNumber: '•••• 2344'),
  ];

  void _onAddCard() {
    // placeholder: replace with actual add-card flow
    setState(() => _cards.add(CardItem(brandLabel: 'Visa', maskedNumber: '•••• 4242')));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Card added')));
  }

  void _confirmRemove(int index) async {
    final remove = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Remove card'),
        content: const Text('Are you sure you want to remove this card?'),
        actions: [
          // TextButton(onPressed: () => Navigator.of(_.pop(false)), child: const Text('Cancel')),
          // TextButton(onPressed: () => Navigator.of(_.pop(true)), child: const Text('Remove')),
        ],
      ),
    );
    if (remove == true) {
      setState(() => _cards.removeAt(index));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppbar(
        screenName: 'Card',
        showBackButton: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            Expanded(
              child: _cards.isEmpty
                  ? Center(
                      child: Text('No linked cards', style: TextStyle(color: Colors.grey[600], fontSize: 14.sp)),
                    )
                  : ListView.separated(
                      itemCount: _cards.length,
                      separatorBuilder: (_, __) => 12.verticalSpace,
                      itemBuilder: (_, idx) {
                        final c = _cards[idx];
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: const Color(0xFFEFEFEF)),
                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 6.r, offset: Offset(0, 2.h))],
                          ),
                          child: Row(
                            children: [
                              // brand icon: use svg if available otherwise simple circle avatar
                              // if (Assets.svgs.exists('mastercard')) // optional helper—adjust if assets.gen doesn't support exists
                              //   SizedBox(width: 44.w, height: 44.w, child: Assets.svgs.mastercard.svg())
                              // else
                              //   CircleAvatar(
                              //     radius: 22.w,
                              //     backgroundColor: const Color(0xFFF3F6F7),
                              //     child: Text(c.brandLabel.substring(0, 1), style: TextStyle(color: Colors.black, fontSize: 16.sp)),
                              //   ),
                              12.horizontalSpace,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(c.brandLabel, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
                                    6.verticalSpace,
                                    Text(c.maskedNumber, style: TextStyle(fontSize: 12.sp, color: Colors.grey[600])),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () => _confirmRemove(idx),
                                icon: Icon(Icons.delete_outline, color: Colors.red.shade400),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),

            16.verticalSpace,

            SizedBox(
              width: double.infinity,
              child: AppButton(
                text: 'Add Card',
                leading: Assets.svgs.formkitAdd,
                onPressed: _onAddCard,
              ),
            ),
          ],
        ),
      ),
    );
  }
}