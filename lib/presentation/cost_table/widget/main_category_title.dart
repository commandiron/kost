import 'package:flutter/material.dart';

class MainCategoryTitle extends StatelessWidget {
  const MainCategoryTitle({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 20),
    );
  }
}
