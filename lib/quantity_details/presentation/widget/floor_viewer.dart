import 'package:flutter/material.dart';
import '../../../common/config/app_space.dart';
import '../../../common/config/app_text_style.dart';
import '../../domain/model/calculator/floor.dart';

class FloorViewer extends StatelessWidget {
  const FloorViewer({
    Key? key,
    required this.width,
    this.minWidth = 80,
    required this.height,
    required this.foundationArea,
    required this.floors,
    required this.onFloorAdd,
    required this.onFloorClick,
  }) : super(key: key);

  final double width;
  final double minWidth;
  final double height;
  final double foundationArea;
  final List<Floor> floors;
  final void Function() onFloorAdd;
  final void Function(Floor floor) onFloorClick;

  @override
  Widget build(BuildContext context) {
    final double widthPerArea = width / foundationArea;
    final double floorHeight = height / floors.length;

    return Column(
      children: [
        IconButton(onPressed: onFloorAdd, icon: const Icon(Icons.add)),
        ListView.builder(
          itemCount: floors.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final floorWidth =
                _calculateFloorWidth(widthPerArea, index, width);
            return Center(
              child: GestureDetector(
                onTap: () {
                  onFloorClick(floors[index]);
                },
                child: Container(
                  width: floorWidth,
                  height: floorHeight,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        floors[index].floorName,
                        style: AppTextStyle.responsiveB1(context),
                      ),
                      AppSpace.hS!,
                      Text(
                        floors[index].area.toString(),
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
      ],
    );
  }

  double _calculateFloorWidth(
      double widthPerArea, int index, double totalWidth) {
    double floorWidth = widthPerArea * floors[index].area;
    if (floorWidth > totalWidth) {
      floorWidth = totalWidth;
    }
    if (floorWidth < minWidth) {
      floorWidth = minWidth;
    }
    return floorWidth;
  }
}
