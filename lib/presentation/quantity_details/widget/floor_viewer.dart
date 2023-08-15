import 'package:flutter/material.dart';
import 'package:kost/domain/extension/formattedNumber.dart';
import 'package:kost/presentation/cost_table/widget/quantity_text_field.dart';

import '../../../config/app_space.dart';
import '../../../config/app_text_style.dart';
import '../../../domain/model/job/calculator/floor.dart';

class FloorViewer extends StatefulWidget {
  const FloorViewer({
    Key? key,
    required this.width,
    this.minWidth = 80,
    required this.height,
    required this.foundationArea,
    required this.floors,
    required this.onFloorAreaChanged,
  }) : super(key: key);

  final double width;
  final double minWidth;
  final double height;
  final double foundationArea;
  final List<Floor> floors;
  final void Function(String floorAreaText, int index) onFloorAreaChanged;

  @override
  State<FloorViewer> createState() => _FloorViewerState();
}

class _FloorViewerState extends State<FloorViewer> {
  final Map<int, bool> _isHighlighted = {};

  @override
  Widget build(BuildContext context) {
    final double widthPerArea = widget.width / widget.foundationArea;
    final double floorHeight = widget.height / widget.floors.length;

    return GestureDetector(
      onTap: () {
        setState(() {
          _isHighlighted.clear();
        });
      },
      child: ListView.builder(
        itemCount: widget.floors.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final floorWidth =
              _calculateFloorWidth(widthPerArea, index, widget.width);
          return Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isHighlighted[index] = !(_isHighlighted[index] ?? false);
                });
              },
              child: Container(
                width: _isHighlighted[index] ?? false
                    ? floorWidth * 2
                    : floorWidth,
                height: _isHighlighted[index] ?? false
                    ? floorHeight * 4
                    : floorHeight,
                decoration: BoxDecoration(border: Border.all()),
                child: _isHighlighted[index] ?? false
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text("Alan:"),
                              SizedBox(
                                  width: 100,
                                  child: QuantityTextField(
                                    formattedQuantity: widget.floors[index].area
                                        .toFormattedText(unit: "TL"),
                                    symbol: "m2",
                                    onChanged: (value) {
                                      widget.onFloorAreaChanged(value, index);
                                    },
                                  ))
                            ],
                          )
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.floors[index].floorName,
                            style: AppTextStyle.responsiveB1(context),
                          ),
                          AppSpace.hS!,
                          Text(
                            widget.floors[index].area.toString(),
                            style: AppTextStyle.responsiveB1(context),
                          ),
                          AppSpace.hS!,
                          Text(
                            "m²",
                            style: AppTextStyle.responsiveB1(context),
                          ),
                        ],
                      ),
              ),
            ),
          );
        },
      ),
    );
  }

  double _calculateFloorWidth(
      double widthPerArea, int index, double totalWidth) {
    double floorWidth = widthPerArea * widget.floors[index].area;
    if (floorWidth > totalWidth) {
      floorWidth = totalWidth;
    }
    if (floorWidth < widget.minWidth) {
      floorWidth = widget.minWidth;
    }
    return floorWidth;
  }
}
