import 'package:bank_app/utils/colors.contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final Color color;
  final Color textColor;
  final bool outline;
  final bool disabled;
  final bool flexible;
  final double height;
  final bool isLoading;

  const CustomButton(
      {this.onTap,
      Key? key,
      required this.text,
      this.color = kPrimaryColor,
      this.outline = false,
      this.textColor = Colors.white,
      this.height = 80,
      this.disabled = false,
      this.flexible = false,
      this.isLoading = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: flexible ? double.infinity : ScreenUtil().setHeight(height),
      width: double.infinity,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(5.0),
          onTap: disabled ? null : onTap,
          child: Ink(
            decoration: outline
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                        color: disabled ? kUnselectedColor : color, width: .7),
                  )
                : BoxDecoration(
                    color: disabled ? kUnselectedColor : color,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: disabled
                        ? []
                        : [
                            BoxShadow(
                                color: color.withOpacity(.269),
                                offset: const Offset(0, 1),
                                blurRadius: 25,
                                spreadRadius: 3)
                          ]),
            child: Center(
              child: isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      text,
                      style: TextStyle(
                          color: outline
                              ? disabled
                                  ? kUnselectedColor
                                  : color
                              : textColor,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w500),
                    ),
            ),
          ),
        ),
      ),
      // child: RaisedButton(
      //   color: outline
      //       ? Colors.transparent
      //       : color != null
      //           ? color
      //           : kPrimaryColor,
      //   elevation: 0,
      //   shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(5),
      //       side: BorderSide(color: color != null ? color : Colors.white)),
      //   child: Text(
      //     text ?? '',
      //     style: TextStyle(
      //         color: outline == null
      //             ? Colors.white
      //             : textColor == null
      //                 ? color != null
      //                     ? color
      //                     : Colors.white
      //                 : textColor,
      //         fontSize: 16,
      //         fontWeight: FontWeight.w500),
      //   ),
      //   onPressed: onTap,
      // ),
    );
  }
}
