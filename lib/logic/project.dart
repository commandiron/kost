import 'package:kost/logic/constants.dart';

import 'floor.dart';

class ProjectProperties {
  final double plotAreaM2;
  final List<ArchitecturalFloor> architecturalFloors;
  final List<StructuralFloor> structuralFloors;
  ProjectProperties._(
    {
      required this.plotAreaM2,
      required this.architecturalFloors,
      required this.structuralFloors,
    }
  );

  static List<StructuralFloor> architecturalFloorsToStructuralFloors(List<ArchitecturalFloor> architecturalFloors) {
    final List<StructuralFloor> structuralFloors = [];

    final ArchitecturalFloor lastBasementFloor;
    lastBasementFloor = architecturalFloors.firstWhere(
          (element) => element.floorType == ArchitecturalFloorType.b3 || element.floorType == ArchitecturalFloorType.b2 || element.floorType == ArchitecturalFloorType.b1,
    );

    final ArchitecturalFloor firstNormalFloor;
    firstNormalFloor = architecturalFloors.firstWhere(
          (element) => element.floorType == ArchitecturalFloorType.k1,
    );

    //Foundation
    structuralFloors.add(
      StructuralFloor(
        ceilingAreaM2: lastBasementFloor.floorAreaM2,
        lengthM: lastBasementFloor.lengthM,
        floorToFloorHeightM: 1,
        floorType: StructuralFloorType.foundation
      )
    );

    //Floors
    for (var architecturalFloor in architecturalFloors) {
      switch(architecturalFloor.floorType) {
        case ArchitecturalFloorType.b3 : structuralFloors.add(
            StructuralFloor(
                ceilingAreaM2: architecturalFloor.floorAreaM2,
                lengthM: architecturalFloor.lengthM,
                floorToFloorHeightM: architecturalFloor.floorToCeilingHeightM + 0.2,
                floorType: StructuralFloorType.b3
            )
        );
        case ArchitecturalFloorType.b2 : structuralFloors.add(
            StructuralFloor(
                ceilingAreaM2: architecturalFloor.floorAreaM2,
                lengthM: architecturalFloor.lengthM,
                floorToFloorHeightM: architecturalFloor.floorToCeilingHeightM + 0.2,
                floorType: StructuralFloorType.b2
            )
        );
        case ArchitecturalFloorType.b1 : structuralFloors.add(
            StructuralFloor(
                ceilingAreaM2: architecturalFloor.floorAreaM2,
                lengthM: architecturalFloor.lengthM,
                floorToFloorHeightM: architecturalFloor.floorToCeilingHeightM + 0.2,
                floorType: StructuralFloorType.b1
            )
        );
        case ArchitecturalFloorType.z : structuralFloors.add(
            StructuralFloor(
                ceilingAreaM2: firstNormalFloor.floorAreaM2,
                lengthM: architecturalFloor.lengthM,
                floorToFloorHeightM: architecturalFloor.floorToCeilingHeightM + 0.3,
                floorType: StructuralFloorType.z
            )
        );
        case ArchitecturalFloorType.k1 : structuralFloors.add(
            StructuralFloor(
                ceilingAreaM2: architecturalFloor.floorAreaM2,
                lengthM: architecturalFloor.lengthM,
                floorToFloorHeightM: architecturalFloor.floorToCeilingHeightM + 0.3,
                floorType: StructuralFloorType.k1
            )
        );
        case ArchitecturalFloorType.k2 : structuralFloors.add(
            StructuralFloor(
                ceilingAreaM2: architecturalFloor.floorAreaM2,
                lengthM: architecturalFloor.lengthM,
                floorToFloorHeightM: architecturalFloor.floorToCeilingHeightM + 0.3,
                floorType: StructuralFloorType.k2
            )
        );
        case ArchitecturalFloorType.k3 : structuralFloors.add(
            StructuralFloor(
                ceilingAreaM2: architecturalFloor.floorAreaM2,
                lengthM: architecturalFloor.lengthM,
                floorToFloorHeightM: architecturalFloor.floorToCeilingHeightM + 0.3,
                floorType: StructuralFloorType.k3
            )
        );
        case ArchitecturalFloorType.k4 : structuralFloors.add(
            StructuralFloor(
                ceilingAreaM2: architecturalFloor.floorAreaM2,
                lengthM: architecturalFloor.lengthM,
                floorToFloorHeightM: architecturalFloor.floorToCeilingHeightM + 0.3,
                floorType: StructuralFloorType.k4
            )
        );
        default :
      }
    }

    //Elevator Tower
    structuralFloors.add(
      StructuralFloor(
        ceilingAreaM2: 25,
        lengthM: 5,
        floorToFloorHeightM: 3.30,
        floorType: StructuralFloorType.elevatorTower
      )
    );

    return structuralFloors;
  }

  factory ProjectProperties(double plotArea, List<ArchitecturalFloor> architecturalFloors,) {
    return ProjectProperties._(
      plotAreaM2: plotArea,
      architecturalFloors: architecturalFloors,
      structuralFloors: architecturalFloorsToStructuralFloors(architecturalFloors),
    );
  }
}

class CostItem {
  String name;
  String explanation;
  Price unitPrice;
  double quantity;
  double liraDollarRate;
  Price totalPriceLira;

  CostItem(
    {
      required this.name,
      required this.explanation,
      required this.unitPrice,
      this.quantity = 0,
      this.liraDollarRate = Constants.currentLiraDollarRate,
    }
  ) : totalPriceLira = Price(
    amount: unitPrice.amount * (unitPrice.currency == Currency.dollar ? liraDollarRate : 1) * quantity ,
    currency: Currency.lira,
    unit: unitPrice.unit
  );
}

class Price {
  double amount;
  Currency currency;
  Unit unit;

  Price(
    {
      required this.amount,
      this.currency = Currency.lira,
      required this.unit,
    }
  );
}

enum Unit {
  meter, squareMeters, cubicMeters, piece, hour, lumpSum, apartment
}

enum Currency {
  lira, dollar,
}