import 'package:bank_app/utils/colors.contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool disable;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? suffixText;
  final IconData? prefixIcon;
  final String? preffixText;

  final void Function()? onTap;
  final List<TextInputFormatter>? mask;
  final Color borderColor;

  const CustomField(
      {Key? key,
      this.disable = false,
      this.controller,
      this.keyboardType = TextInputType.text,
      this.onChanged,
      this.validator,
      required this.hintText,
      this.suffixIcon,
      this.obscureText = false,
      this.onTap,
      this.mask,
      this.borderColor = kPrimaryColor,
      this.prefixIcon,
      this.suffixText,
      this.preffixText})
      : super(key: key);

  Color decideColorBorder({required bool onFocus}) {
    if (onFocus) {
      return borderColor;
    } else {
      return const Color(0xFFECF0F3);
    }
  }

  Color decideColorLabel({required bool onFocus}) {
    if (onFocus) {
      return kPrimaryColor;
    } else {
      return const Color(0xFFADB5BD);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(3)),
      child: Container(
          height: ScreenUtil().setHeight(98),
          decoration: const BoxDecoration(
            color: Color(0xFFF8F9FA),
          ),
          child: TextField(
              cursorColor: kPrimaryColor,
              enabled: !disable,
              onTap: onTap,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(28),
                  color: const Color(0xFF495057)),
              inputFormatters: mask,
              controller: controller,
              keyboardType: keyboardType,
              obscureText: obscureText,
              onChanged: onChanged,
              //validator: validator,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 30,
                    minHeight: 30,
                  ),
                  suffixIconConstraints: const BoxConstraints(
                    minWidth: 30,
                    minHeight: 30,
                  ),
                  contentPadding: const EdgeInsets.all(14.0),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  isDense: true,
                  labelText: hintText,
                  prefixIcon: prefixIcon != null
                      ? Icon(prefixIcon, color: kPrimaryColor)
                      : preffixText != null
                          ? SizedBox(
                              width: 20,
                              child: Center(
                                child: Text(
                                  preffixText!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: kPrimaryColor,
                                      fontSize: 10),
                                ),
                              ),
                            )
                          : null,
                  suffixIcon: suffixIcon ??
                      (suffixText != null
                          ? SizedBox(
                              width: 20,
                              child: Center(
                                child: Text(
                                  suffixText!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: kPrimaryColor,
                                      fontSize: 10),
                                ),
                              ),
                            )
                          : null),
                  suffixStyle: const TextStyle(color: kPrimaryColor)

                  //     : InputDecoration(
                  //         hintStyle: TextStyle(fontSize: 22),
                  //         floatingLabelBehavior: FloatingLabelBehavior.always,
                  //         hintText: hintText,
                  //         suffixIcon: iconData != null
                  //             ? Icon(
                  //                 iconData,
                  //               )
                  //             : null)
                  ))),
    );
  }
}
