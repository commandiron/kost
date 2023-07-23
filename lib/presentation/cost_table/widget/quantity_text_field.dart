import 'package:flutter/material.dart';

class QuantityTextField extends StatefulWidget {
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
  State<QuantityTextField> createState() => _QuantityTextFieldState();
}

class _QuantityTextFieldState extends State<QuantityTextField> {
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: TextFormField(
        controller: TextEditingController(text: widget.formattedQuantity),
        decoration: InputDecoration(suffix: Text(widget.symbol)),
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
          return null;
        },
        onFieldSubmitted: (value) {
          if (_key.currentState!.validate()) {
            if (widget.onFieldSubmitted != null) {
              widget.onFieldSubmitted!(value);
            }
          }
        },
        onChanged: (value) {
          if (_key.currentState!.validate()) {
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          }
        },
      ),
    );
  }
}
