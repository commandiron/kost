import 'package:flutter/material.dart';
import 'package:kost/common/config/app_text_style.dart';

import '../../../../common/config/app_padding.dart';

class EditFloorSubTitle extends StatelessWidget {
  const EditFloorSubTitle({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.allS!,
      child: Text(
        text,
        style: AppTextStyle.responsiveH4(context),
      ),
    );
  }
}
