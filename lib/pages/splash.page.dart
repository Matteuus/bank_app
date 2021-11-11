import 'package:animate_do/animate_do.dart';
import 'package:bank_app/pages/home.page.dart';
import 'package:bank_app/utils/colors.contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
    });
    return Scaffold(
      body: Center(
        child: ZoomIn(
          duration: const Duration(seconds: 2),
          child: SvgPicture.asset(
            'assets/in_bolso.svg',
            fit: BoxFit.cover,
            color: kPrimaryColor,
            width: 200.w,
            height: 200.h,
          ),
        ),
      ),
    );
  }
}
