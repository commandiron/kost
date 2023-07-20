import 'package:flutter/material.dart';

import '../../../config/app_space.dart';
import '../../../config/app_text_style.dart';
import '../../../domain/calculator/detailed/floor.dart';

class FloorViewer extends StatelessWidget {
  const FloorViewer({Key? key, required this.width, required this.height, required this.floors, required this.foundationArea,}) : super(key: key);

  final double width;
  final double height;
  final List<Floor> floors;
  final double foundationArea;

  @override
  Widget build(BuildContext context) {
    final double widthPerFoundationSquareMeter = width / foundationArea;

    final double roofWidth = widthPerFoundationSquareMeter * (floors.isNotEmpty ? floors.first.area * 1.2 : 0);
    final double roofHeight =  height / (floors.length + 2);

    final double foundationWidth = width;
    final double foundationHeight = (height / (floors.length + 1)) * 0.5;

    return SizedBox(
      width: width,
      height: height,
      child: Column(
        children: [
          CustomPaint(
            painter: TrianglePainter(
              strokeColor: Colors.red,
              strokeWidth: 1,
              paintingStyle: PaintingStyle.fill,
            ),
            child: SizedBox(
              width: roofWidth,
              height: roofHeight,
            ),
          ),
          ListView.builder(
            itemCount: floors.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final floorWidth = widthPerFoundationSquareMeter * floors[index].area;
              final floorHeight = (height - (roofHeight + foundationHeight)) / floors.length;
              return Align(
                alignment: Alignment.center,
                child: Container(
                  color: Colors.blue,
                  width: floorWidth,
                  height: floorHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(floors[index].type.nameTr, style: AppTextStyle.l1,),
                      AppSpace.hS!,
                      Text(floors[index].area.toString(), style: AppTextStyle.l1,),
                      AppSpace.hS!,
                      Text("m²", style: AppTextStyle.l1,),
                    ],
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
                Text(foundationArea.toString(), style: AppTextStyle.l1,),
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