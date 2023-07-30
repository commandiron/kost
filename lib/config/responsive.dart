import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1000 &&
      MediaQuery.of(context).size.width >= 600;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1000;

  static dynamic value(
      BuildContext context,
      mobileValue,
      tabletValue,
      desktopValue
  ) {
    if(MediaQuery.of(context).size.width >= 1000) {
      return desktopValue;
    }
    if(
    MediaQuery.of(context).size.width < 1000 &&
        MediaQuery.of(context).size.width >= 600
    ) {
      return tabletValue;
    }
    if(MediaQuery.of(context).size.width < 600) {
      return mobileValue;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1000) {
          return desktop;
        } else if (constraints.maxWidth >= 600) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
