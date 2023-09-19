import 'package:flutter/material.dart';

class SlidingPageRouteBuilder<T> extends PageRouteBuilder<T> {
  final Widget page;
  final Offset beginOffset;
  final Offset endOffset;
  final Duration duration;

  SlidingPageRouteBuilder({
    required this.page,
    this.beginOffset = const Offset(1.0, 0.0),
    this.endOffset = Offset.zero,
    this.duration = const Duration(milliseconds: 300),
  }) : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {

      const curve = Curves.easeInOut;

      var tween = Tween(begin: beginOffset, end: endOffset)
          .chain(CurveTween(curve: curve));

      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}