import 'package:flutter/material.dart';

import '../../../../common/config/app_padding.dart';
import '../../../../common/config/app_text_style.dart';
import '../../../../common/widget/quantity_text_field.dart';

class FloorAttrTextField extends StatefulWidget {
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
  State<FloorAttrTextField> createState() => _FloorAttrTextFieldState();
}

class _FloorAttrTextFieldState extends State<FloorAttrTextField> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.hM!.add(AppPadding.vS!),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: Text(
            widget.title,
            style: AppTextStyle.responsiveH5(context),
          )),
          Expanded(
            flex: 2,
            child: Form(
              key: _formKey,
              child: QuantityTextField(
                formattedQuantity: widget.formattedQuantity,
                symbol: widget.symbol,
                onChanged: (value) {
                  if(widget.onChanged != null) {
                    if(_formKey.currentState!.validate()){
                      widget.onChanged!(value);
                    }
                  }
                },
                onFieldSubmitted: (value) {
                  if(widget.onFieldSubmitted != null) {
                    if(_formKey.currentState!.validate()){
                      widget.onFieldSubmitted!(value);
                    }
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}