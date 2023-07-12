import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/domain/model/cost/cost_category.dart';
import 'package:kost/domain/model/unit_price/unit.dart';

import '../../../domain/bloc/cost_table_bloc.dart';
import '../../../domain/bloc/cost_table_event.dart';

class QuantityTextField extends StatefulWidget {
  const QuantityTextField(
      {Key? key, required this.formattedQuantity, required this.costCategory})
      : super(key: key);

  final String formattedQuantity;
  final CostCategory costCategory;

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
        decoration: InputDecoration(
            suffix: Text(widget.costCategory.unitPriceCategory.unit.symbol)),
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
            context
                .read<CostTableBloc>()
                .add(ChangeQuantity(widget.costCategory.jobCategory, value));
          }
        },
      ),
    );
  }
}
