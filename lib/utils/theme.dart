import 'package:bank_app/utils/colors.contants.dart';
import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
      appBarTheme: appBarTheme(),
      primaryColor: kPrimaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: kBackgroundColor,
      fontFamily: 'NunitoSans',
      inputDecorationTheme: inputDecorationTheme(),
      disabledColor: kUnselectedColor,
      textTheme: textTheme());
}

InputDecorationTheme inputDecorationTheme() {
  return const InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey),
      labelStyle: TextStyle(color: kTextColor));
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: kBackgroundColor,
    elevation: 0,
    iconTheme: IconThemeData(
      color: kPrimaryColor,
    ),
  );
}
