import 'package:flutter/material.dart';

import '../../../../common/config/app_padding.dart';
import '../../../../common/config/app_text_style.dart';

class FloorAttrCheckBox extends StatefulWidget {
  const FloorAttrCheckBox(
      {super.key, required this.title, required this.value, this.onChanged});

  final String title;
  final bool value;
  final void Function(bool? value)? onChanged;

  @override
  State<FloorAttrCheckBox> createState() => _FloorAttrCheckBoxState();
}

class _FloorAttrCheckBoxState extends State<FloorAttrCheckBox> {
  
  bool _valueOnView = false;

  @override
  void initState() {
    _valueOnView = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.hM!.add(AppPadding.vS!),
      child: Row(
        children: [
          Expanded(
            child:
                Text(widget.title, style: AppTextStyle.responsiveH5(context)),
          ),
          Expanded(
            flex: 2,
            child: Checkbox(
              value: _valueOnView,
              onChanged: (value) {
                setState(() {
                  _valueOnView = value ?? false;
                });
                if(widget.onChanged != null) {
                  widget.onChanged!(value);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}