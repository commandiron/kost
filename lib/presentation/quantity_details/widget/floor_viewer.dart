import 'package:flutter/material.dart';
import 'package:kost/domain/helper/formattedNumber.dart';
import 'package:kost/presentation/cost_table/widget/quantity_text_field.dart';

import '../../../config/app_space.dart';
import '../../../config/app_text_style.dart';
import '../../../domain/calculator/detailed/floor.dart';

class FloorViewer extends StatefulWidget {
  const FloorViewer({
    Key? key,
    required this.width,
    this.minWidth = 120,
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

    final double foundationWidth = widget.width;
    final double foundationHeight = (widget.height / (widget.floors.length + 1)) * 0.5;

    double widthPerArea = 1;
    if(widget.foundationArea != 0) {
      widthPerArea = foundationWidth / widget.foundationArea;
    }

    double roofWidth = widthPerArea * (widget.floors.isNotEmpty ? widget.floors.first.area * 1.2 : widget.width / 2);
    if (roofWidth < widget.minWidth) {
      roofWidth = widget.minWidth;
    }

    final double roofHeight = (widget.height / (widget.floors.length + 2));
    final double floorHeight = (widget.height - (roofHeight + foundationHeight)) / widget.floors.length;

    return GestureDetector(
      onTap: () {
        setState(() {
          _isHighlighted.clear();
        });
      },
      child: Column(
        children: [
          CustomPaint(
            painter: TrianglePainter(strokeWidth: 1),
            child: SizedBox(
              width: roofWidth,
              height: roofHeight,
            ),
          ),
          ListView.builder(
            itemCount: widget.floors.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final floorWidth = _calculateFloorWidth(widthPerArea, index, foundationWidth);
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
                                        formattedQuantity: getFormattedNumber(
                                            number: widget.floors[index].area),
                                        symbol: "m2",
                                        onChanged: (value) {
                                          widget.onFloorAreaChanged(
                                              value, index);
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
          Container(
            width: foundationWidth,
            height: foundationHeight,
            decoration: BoxDecoration(border: Border.all()),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Temel",
                  style: AppTextStyle.responsiveB2(context),
                ),
                AppSpace.hS!,
                Text(
                  widget.foundationArea.toString(),
                  style: AppTextStyle.responsiveB2(context),
                ),
                AppSpace.hS!,
                Text(
                  "m²",
                  style: AppTextStyle.responsiveB2(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double _calculateFloorWidth(double widthPerArea, int index, double foundationWidth) {
    double floorWidth = widthPerArea * widget.floors[index].area;
    if (floorWidth > foundationWidth) {
      floorWidth = foundationWidth;
    }
    if (floorWidth < widget.minWidth) {
      floorWidth = widget.minWidth;
    }
    return floorWidth;
  }
}

class TrianglePainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  TrianglePainter(
      {this.strokeColor = Colors.black,
      this.strokeWidth = 3,
      this.paintingStyle = PaintingStyle.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x / 2, 0)
      ..lineTo(x, y)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
