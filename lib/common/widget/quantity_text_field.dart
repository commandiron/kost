import 'package:flutter/material.dart';
import 'package:kost/common/config/app_text_style.dart';

class QuantityTextField extends StatelessWidget {
  const QuantityTextField(
      {Key? key,
      required this.formattedQuantity,
      required this.symbol,
      this.onFieldSubmitted, 
      this.onChanged})
      : super(key: key);

  final String formattedQuantity;
  final String symbol;
  final void Function(String value)? onFieldSubmitted;
  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditingController(text: formattedQuantity),
      decoration: InputDecoration(
        errorStyle: AppTextStyle.responsiveB2(context),
        suffix: Text(symbol)
      ),
      style: AppTextStyle.responsiveB1(context),
      textAlign: TextAlign.center,
      validator: (value) {
        const String message = "Lütfen sayı giriniz.";
        if (value == null) {
          return message;
        }
        if (value.isEmpty) {
          return message;
        }
        if (RegExp(r'[^\d,]').hasMatch(value)) {
          return message;
        }
        int commaIndex = value.lastIndexOf(',');
        if(commaIndex == -1) {
          if(value.length > 9) {
            return "Daha küçük bir sayı giriniz.";
          }
        }
        if(commaIndex > 9) {
          return "Daha küçük bir sayı giriniz.";
        }
        return null;
      },
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
    );
  }
}
