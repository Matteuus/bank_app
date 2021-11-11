import 'package:bank_app/utils/colors.contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CreditCardResumedWidget extends StatelessWidget {
  final String title;
  final String content;
  final bool isLoading;
  const CreditCardResumedWidget({
    Key? key,
    required this.title,
    required this.isLoading,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        height: 86.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kBackgroungBasicCreditCardColor,
          borderRadius: BorderRadius.circular(16.h),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 32.w, right: 32.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.transparent,
                highlightColor: kPrimaryColor,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.transparent,
                highlightColor: kPrimaryColor,
                child: Text(
                  content,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 86.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kBackgroungBasicCreditCardColor,
          borderRadius: BorderRadius.circular(16.h),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 32.w, right: 32.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                content,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
