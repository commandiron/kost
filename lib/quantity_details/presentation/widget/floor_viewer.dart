import 'package:flutter/material.dart';
import '../../../common/config/app_space.dart';
import '../../../common/config/app_text_style.dart';
import '../../domain/model/floor.dart';

class FloorViewer extends StatelessWidget {
  const FloorViewer({
    Key? key,
    required this.width,
    this.minWidth = 100,
    required this.height,
    required this.floors,
    required this.onAddFloor,
    required this.onClickFloor,
  }) : super(key: key);

  final double width;
  final double minWidth;
  final double height;
  final List<Floor> floors;
  final void Function(int newFloorNo) onAddFloor;
  final void Function(Floor floor) onClickFloor;

  @override
  Widget build(BuildContext context) {
    final basementFloors = floors.where((element) => element.no < 0).toList();
    final bottomMostBasementFloor = basementFloors.reduce((current, next) {
      return current.no < next.no ? current : next;
    });
    final double widthPerArea = width / bottomMostBasementFloor.area;
    final double floorHeight = height / floors.length;

    return Column(
      children: [
        IconButton(
          onPressed: () {
            onAddFloor(
              floors.reduce(
                (value, element) => element.no > value.no ? element : value
              ).no + 1
            );
          }, 
          icon: const Icon(Icons.add)
        ),
        ListView.builder(
          itemCount: floors.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final floorWidth = _calculateFloorWidth(widthPerArea, index, width);
            return Center(
              child: InkWell(
                onTap: () {
                  onClickFloor(floors[index]);
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
        IconButton(
          onPressed: () {
            onAddFloor(
              floors.reduce(
                (value, element) => element.no < value.no ? element : value
              ).no - 1
            );
          }, 
          icon: const Icon(Icons.add)
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
