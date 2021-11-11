import 'package:bank_app/utils/colors.contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class CreditCardWidget extends StatelessWidget {
  final double cardHeight;
  final double cardWidth;
  final String bankName;
  final String cardNumber;
  final String cardLimit;
  final String cardName;
  final String imageCreditCard;
  final bool isRounded;
  final bool isLoading;
  const CreditCardWidget(
      {Key? key,
      required this.bankName,
      required this.cardNumber,
      required this.cardLimit,
      required this.imageCreditCard,
      required this.cardName,
      required this.cardHeight,
      required this.isRounded,
      required this.isLoading,
      required this.cardWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        height: cardHeight,
        width: cardWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              kPrimaryColor,
              kPrimaryColor.withOpacity(0.4),
            ],
          ),
          borderRadius: isRounded ? BorderRadius.circular(10) : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.transparent,
                highlightColor: kPrimaryColor.withOpacity(0.4),
                child: SvgPicture.asset(
                  'assets/in_bolso.svg',
                  height: 64.h,
                  width: 64.w,
                  color: Colors.white,
                ),
              ),
              Positioned(
                  left: cardWidth * 0.78,
                  child: Shimmer.fromColors(
                    baseColor: Colors.red,
                    highlightColor: Colors.yellow,
                    child: Image.asset(
                      imageCreditCard,
                      height: 64.h,
                      width: 64.w,
                    ),
                  )),
              Positioned(
                top: cardHeight * 0.4,
                child: Shimmer.fromColors(
                  baseColor: Colors.transparent,
                  highlightColor: Colors.white,
                  child: Text(
                    "R\$ $cardLimit",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 36.sp),
                  ),
                ),
              ),
              Positioned(
                top: cardHeight * 0.75,
                child: Shimmer.fromColors(
                  baseColor: Colors.transparent,
                  highlightColor: Colors.white,
                  child: Text(
                    cardName,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.sp),
                  ),
                ),
              ),
              Positioned(
                top: cardHeight * 0.75,
                left: cardWidth * 0.7,
                child: Shimmer.fromColors(
                  baseColor: Colors.transparent,
                  highlightColor: Colors.white,
                  child: Text(
                    "**** $cardNumber",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: cardHeight,
        width: cardWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              kPrimaryColor,
              kPrimaryColor.withOpacity(0.4),
            ],
          ),
          borderRadius: isRounded ? BorderRadius.circular(10) : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              SvgPicture.asset(
                'assets/in_bolso.svg',
                height: 64.h,
                width: 64.w,
                color: Colors.white,
              ),
              Positioned(
                  left: cardWidth * 0.78,
                  child: Image.asset(
                    imageCreditCard,
                    height: 64.h,
                    width: 64.w,
                  )),
              Positioned(
                top: cardHeight * 0.4,
                child: Text(
                  "R\$ $cardLimit",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 36.sp),
                ),
              ),
              Positioned(
                top: cardHeight * 0.75,
                child: Text(
                  cardName,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp),
                ),
              ),
              Positioned(
                top: cardHeight * 0.75,
                left: cardWidth * 0.7,
                child: Text(
                  "**** $cardNumber",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
