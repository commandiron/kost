import 'package:flutter/material.dart';
import 'package:kost/common/config/responsive.dart';

class AppTextStyle {
  // Headings
  static late TextStyle h1;
  static late TextStyle h1b;
  static late TextStyle h2;
  static late TextStyle h2b;
  static late TextStyle h3;
  static late TextStyle h3b;
  static late TextStyle h4;
  static late TextStyle h4b;
  static late TextStyle h5;
  static late TextStyle h5b;

  // Body
  static late TextStyle b1;
  static late TextStyle b1b;
  static late TextStyle b2;
  static late TextStyle b2b;
  static late TextStyle b3;
  static late TextStyle b3b;
  static late TextStyle b4;
  static late TextStyle b4b;

  // Label
  static late TextStyle l1;
  static late TextStyle l1b;
  static late TextStyle l2;
  static late TextStyle l2b;

  static init(BuildContext context) {

    const baseStyle = TextStyle(fontWeight: FontWeight.w400);
    const bold = FontWeight.bold;

    h1 = baseStyle.copyWith(fontSize: 32);
    h1b = h1.copyWith(fontWeight: bold);

    h2 = baseStyle.copyWith(fontSize: 28);
    h2b = h2.copyWith(fontWeight: bold);

    h3 = baseStyle.copyWith(fontSize: 24);
    h3b = h3.copyWith(fontWeight: bold);

    h4 = baseStyle.copyWith(fontSize: 20);
    h4b = h4.copyWith(fontWeight: bold);

    h5 = baseStyle.copyWith(fontSize: 16);
    h5b = h5.copyWith(fontWeight: bold);

    b1 = baseStyle.copyWith(fontSize: 14);
    b1b = b1.copyWith(fontWeight: bold);

    b2 = baseStyle.copyWith(fontSize: 12);
    b2b = b2.copyWith(fontWeight: bold);

    b3 = baseStyle.copyWith(fontSize: 10);
    b3b = b3.copyWith(fontWeight: bold);

    b4 = baseStyle.copyWith(fontSize: 8);
    b4b = b4.copyWith(fontWeight: bold);

    l1 = baseStyle.copyWith(fontSize: 6);
    l1b = l1.copyWith(fontWeight: bold);

    l2 = baseStyle.copyWith(fontSize: 4);
    l2b = l2.copyWith(fontWeight: bold);
  }

  static TextStyle responsiveH3(BuildContext context) {
    return Responsive.value(context, AppTextStyle.h5, AppTextStyle.h4, AppTextStyle.h3);
  }
  static TextStyle responsiveH3B(BuildContext context) {
    return Responsive.value(context, AppTextStyle.h5b, AppTextStyle.h4b, AppTextStyle.h3b);
  }
  static TextStyle responsiveH4(BuildContext context) {
    return Responsive.value(context, AppTextStyle.b1, AppTextStyle.h5, AppTextStyle.h4);
  }
  static TextStyle responsiveH4B(BuildContext context) {
    return Responsive.value(context, AppTextStyle.b1b, AppTextStyle.h5b, AppTextStyle.h4b);
  }
  static TextStyle responsiveH5(BuildContext context) {
    return Responsive.value(context, AppTextStyle.b2, AppTextStyle.b1, AppTextStyle.h5);
  }
  static TextStyle responsiveH5B(BuildContext context) {
    return Responsive.value(context, AppTextStyle.b2b, AppTextStyle.b1b, AppTextStyle.h5b);
  }
  static TextStyle responsiveB1(BuildContext context) {
    return Responsive.value(context, AppTextStyle.b3, AppTextStyle.b2, AppTextStyle.b1);
  }
  static TextStyle responsiveB2(BuildContext context) {
    return Responsive.value(context, AppTextStyle.b4, AppTextStyle.b3, AppTextStyle.b2);
  }
  static TextStyle responsiveB3(BuildContext context) {
    return Responsive.value(context, AppTextStyle.l1, AppTextStyle.b4, AppTextStyle.b3);
  }
}
