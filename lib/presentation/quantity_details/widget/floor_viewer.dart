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
    final double roofHeight =  (height / (floors.length + 2)) * 0.5;

    final double foundationWidth = width;
    final double foundationHeight = (height / (floors.length + 1)) * 0.5;

    return SizedBox(
      width: width,
      height: height,
      child: Column(
        children: [
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