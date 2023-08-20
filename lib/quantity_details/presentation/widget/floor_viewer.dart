import 'package:flutter/material.dart';
import '../../../common/config/app_space.dart';
import '../../../common/config/app_text_style.dart';
import '../../domain/model/calculator/floor.dart';

class FloorViewer extends StatefulWidget {
  const FloorViewer({
    Key? key,
    required this.width,
    this.minWidth = 80,
    required this.height,
    required this.foundationArea,
    required this.floors,
    required this.onFloorAdd,
    required this.onFloorClick,
    required this.onFloorDelete,
    required this.onFloorAreaChanged,
  }) : super(key: key);

  final double width;
  final double minWidth;
  final double height;
  final double foundationArea;
  final List<Floor> floors;
  final void Function() onFloorAdd;
  final void Function(int no) onFloorClick;
  final void Function(int no) onFloorDelete;
  final void Function(String floorAreaText, int no) onFloorAreaChanged;

  @override
  State<FloorViewer> createState() => _FloorViewerState();
}

class _FloorViewerState extends State<FloorViewer> {
  @override
  Widget build(BuildContext context) {
    final double widthPerArea = widget.width / widget.foundationArea;
    final double floorHeight = widget.height / widget.floors.length;

    return Column(
      children: [
        IconButton(onPressed: widget.onFloorAdd, icon: const Icon(Icons.add)),
        ListView.builder(
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
                  widget.onFloorClick(widget.floors[index].no);
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
      ],
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
