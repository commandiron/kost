import 'package:flutter/material.dart';

import '../../../../common/config/app_padding.dart';
import '../../../../common/config/app_text_style.dart';
import '../../../../common/widget/quantity_text_field.dart';

class FloorAttrTextField extends StatelessWidget {
  const FloorAttrTextField({
    super.key,
    required this.title,
    required this.formattedQuantity,
    required this.symbol,
    this.onChanged,
    this.onFieldSubmitted,
  });

  final String title;
  final String formattedQuantity;
  final String symbol;
  final Function(String value)? onChanged;
  final Function(String value)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.hM!.add(AppPadding.vS!),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: Text(
            title,
            style: AppTextStyle.responsiveH5(context),
          )),
          Expanded(
            flex: 2,
            child: QuantityTextField(
              formattedQuantity: formattedQuantity,
              symbol: symbol,
              onChanged: onChanged,
              onFieldSubmitted: onFieldSubmitted,
            ),
          ),
        ],
      ),
    );
  }
}