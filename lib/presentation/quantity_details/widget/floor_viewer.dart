import 'package:flutter/material.dart';

import '../../../config/app_space.dart';
import '../../../config/app_text_style.dart';
import '../../../domain/calculator/detailed/floor.dart';

class FloorViewer extends StatefulWidget {
  const FloorViewer({Key? key, required this.width, required this.height, required this.foundationArea, required this.floors,}) : super(key: key);

  final double width;
  final double height;
  final double foundationArea;
  final List<Floor> floors;


  @override
  State<FloorViewer> createState() => _FloorViewerState();
}

class _FloorViewerState extends State<FloorViewer> {

  Map<int, bool> _isHighlighted = {};

  @override
  Widget build(BuildContext context) {
    final double foundationWidth = widget.width;
    final double foundationHeight = (widget.height / (widget.floors.length + 1)) * 0.5;
    final double widthPerFoundationSquareMeter = foundationWidth / widget.foundationArea;

    final double roofWidth = widthPerFoundationSquareMeter * (widget.floors.isNotEmpty ? widget.floors.first.area * 1.2 : widget.width / 2);
    final double roofHeight =  (widget.height / (widget.floors.length + 2));

    return GestureDetector(
      onTap: () {
        setState(() {
          _isHighlighted.clear();
        });
      },
      child: Column(
        children: [
          CustomPaint(
            painter: TrianglePainter(
              paintingStyle: PaintingStyle.fill,
              strokeColor: Colors.red
            ),
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
              final floorWidth = widthPerFoundationSquareMeter * widget.floors[index].area;
              final floorHeight = (widget.height - (roofHeight + foundationHeight)) / widget.floors.length;
              return Align(
                alignment: Alignment.center,
                child: InkWell(
                  onHover: (value) {
                    //Adaptive config
                  },
                  onTap: () {
                    setState(() {
                      _isHighlighted = {index : !(_isHighlighted[index] ?? false)};
                    });
                  },
                  child: Container(
                    color: Colors.blue,
                    width: _isHighlighted[index] ?? false ? floorWidth * 2 : floorWidth,
                    height: _isHighlighted[index] ?? false ? floorHeight * 3 : floorHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(widget.floors[index].type.nameTr, style: AppTextStyle.l1,),
                        AppSpace.hS!,
                        Text(widget.floors[index].area.toString(), style: AppTextStyle.l1,),
                        AppSpace.hS!,
                        Text("m²", style: AppTextStyle.l1,),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Container(
            color: Colors.grey,
            width: foundationWidth,
            height: foundationHeight,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Temel", style: AppTextStyle.l1,),
                AppSpace.hS!,
                Text(widget.foundationArea.toString(), style: AppTextStyle.l1,),
                AppSpace.hS!,
                Text("m²", style: AppTextStyle.l1,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  TrianglePainter({this.strokeColor = Colors.black, this.strokeWidth = 3, this.paintingStyle = PaintingStyle.stroke});

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