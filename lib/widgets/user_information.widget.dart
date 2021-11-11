import 'package:bank_app/utils/colors.contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class UserInformationWidget extends StatelessWidget {
  final bool isLoading;
  final String userName;
  final String userImage;
  const UserInformationWidget(
      {Key? key,
      required this.userName,
      required this.userImage,
      required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.transparent,
            highlightColor: kPrimaryColor,
            child: Text(
              "Olá,\n$userName",
              style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.transparent,
            highlightColor: kPrimaryColor,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.w),
              child: Image.asset(
                userImage,
                fit: BoxFit.cover,
                height: 100.h,
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Hero(
            tag: 'userName',
            child: Text(
              "Olá,\n$userName",
              style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Hero(
            tag: 'userImage',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.w),
              child: Image.network(
                userImage,
                fit: BoxFit.cover,
                height: 100.h,
              ),
            ),
          ),
        ],
      );
    }
  }
}
