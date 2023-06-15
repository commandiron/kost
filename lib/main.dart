import 'package:flutter/material.dart';
import 'package:kost/logic/project.dart';

import 'logic/floor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {


    final architecturalFloors = [
      ArchitecturalFloor(
        floorAreaM2: 477,
        lengthM: 100,
        floorType: ArchitecturalFloorType.b1
      ),
      ArchitecturalFloor(
        floorAreaM2: 177,
        lengthM: 50,
        floorType: ArchitecturalFloorType.z
      ),
      ArchitecturalFloor(
        floorAreaM2: 220,
        lengthM: 60,
        floorType: ArchitecturalFloorType.k1
      ),
      ArchitecturalFloor(
          floorAreaM2: 220,
          lengthM: 60,
          floorType: ArchitecturalFloorType.k2
      ),
      ArchitecturalFloor(
          floorAreaM2: 220,
          lengthM: 60,
          floorType: ArchitecturalFloorType.k3
      ),
      ArchitecturalFloor(
        floorAreaM2: 220,
        lengthM: 60,
        floorType: ArchitecturalFloorType.k4
      ),
    ];

    final a = ProjectProperties(
      1000,
      architecturalFloors
    );
    return MaterialApp(
      home: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: architecturalFloors.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Text(architecturalFloors[index].floorType.toString()),
                    SizedBox(width: 16,),
                    Text(architecturalFloors[index].floorAreaM2.toString()),
                  ],
                );
              },
            ),
            SizedBox(height: 16,),
            ListView.builder(
              shrinkWrap: true,
              itemCount: a.structuralFloors.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Text(a.structuralFloors[index].floorType.toString()),
                    SizedBox(width: 16,),
                    Text(a.structuralFloors[index].ceilingAreaM2.toString()),
                  ],
                );
              },
            ),
          ],
        )
      )
    );
  }
}