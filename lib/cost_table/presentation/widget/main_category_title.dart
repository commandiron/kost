import 'package:flutter/material.dart';
import 'package:kost/common/config/app_text_style.dart';

class MainCategoryTitle extends StatelessWidget {
  const MainCategoryTitle({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyle.responsiveH4B(context)
    );
  }
}
