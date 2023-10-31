import 'package:kost/apartment_details/domain/model/floor/room/apartment_room.dart';
import 'package:kost/apartment_details/domain/model/floor/room/common_area_room.dart';
import 'package:kost/apartment_details/domain/model/floor/room/room.dart';
import 'package:kost/apartment_details/domain/model/floor/window.dart';

import 'floor_section.dart';

class InitialFloor extends Floor {
  InitialFloor(
    {
      super.no = 0,
      super.area = 0,
      super.perimeter = 0,
      super.heightWithSlab = 3.3,
      super.slabHeight = 0.3,
      super.thickWallLength = 0,
      super.thinWallLength = 0,
      super.isCeilingSlabHollow = true,
      super.sections = const []
    }
  );
}

class Floor {
  int no;
  final double area;
  final double perimeter;
  final double heightWithSlab;
  final double slabHeight;
  final bool isCeilingSlabHollow;
  final double thickWallLength;
  final double thinWallLength;
  final List<FloorSection> sections;


  Floor(
      {required this.no,
      required this.area,
      required this.perimeter,
      required this.heightWithSlab,
      required this.slabHeight,
      required this.isCeilingSlabHollow,
      required this.thickWallLength,
      required this.thinWallLength,
      required this.sections});

  Floor copyWith({
    int? no,
    double? area,
    final double? perimeter,
    final double? heightWithSlab,
    final double? slabHeight,
    final bool? isCeilingSlabHollow,
    final double? thickWallLength,
    final double? thinWallLength,
    final List<FloorSection>? sections,
  }) {
    return Floor(
      no: no ?? this.no,
      area: area ?? this.area,
      perimeter: perimeter ?? this.perimeter,
      heightWithSlab: heightWithSlab ?? this.heightWithSlab,
      slabHeight: slabHeight ?? this.slabHeight,
      isCeilingSlabHollow: isCeilingSlabHollow ?? this.isCeilingSlabHollow,
      thickWallLength: thickWallLength ?? this.thickWallLength,
      thinWallLength: thinWallLength ?? this.thinWallLength,
      sections: sections ?? this.sections
    );
  }

  static List<Floor> duplicateFloors(Floor floor, {required int count}) {
    if (floor.no == -3 || floor.no == -2 || floor.no == -1 || floor.no == 0) {
      throw (Exception("Basements or ground floor cannot be duplicate"));
    }

    final List<Floor> result = [];
    for (var i = floor.no; i <= count; i++) {
      result.add(Floor(
        no: i,
        area: floor.area,
        perimeter: floor.perimeter,
        heightWithSlab: floor.heightWithSlab,
        slabHeight: floor.slabHeight,
        isCeilingSlabHollow: floor.isCeilingSlabHollow,
        thickWallLength: floor.thickWallLength,
        thinWallLength: floor.thinWallLength,
        sections: floor.sections
      ));
    }
    return result;
  }

  //DATA
  static List<Floor> test1 = [
    ...duplicateFloors(
      Floor(
        no: 1,
        area: 228.68,
        perimeter: 63.6,
        heightWithSlab: 3.3,
        slabHeight: 0.3,
        isCeilingSlabHollow: true,
        thickWallLength: 88.24,
        thinWallLength: 49.54,
        sections: [
          CommonArea(
              rooms: [
                ElevatorShaft(area: 9.5, perimeter: 12.6),
                Stairs(area: 6.86, perimeter: 10.5),
                Stairs(area: 14.73, perimeter: 15.5),
                BuildingFloorHall(area: 4.65, perimeter: 9.25,),
              ]
          ),
          Apartment(
              rooms: [
                ApartmentHall(area: 10.66, perimeter: 20.65),
                Saloon(area: 27.36, perimeter: 23.20, windows: [Window(width: 19, height: 2.5,)]),
                Kitchen(area: 7.58, perimeter: 11.55, windows: []),
                NormalRoom(area: 7.45, perimeter: 10.95, windows: []),
                NormalRoom(area: 7.96, perimeter: 11.85, windows: []),
                NormalRoom(area: 12.11, perimeter: 15.15, windows: []),
                Bathroom(area: 4.87, perimeter: 9.05, windows: []),
                EscapeHallBathroom(area: 3.08, perimeter: 7.05, windows: []),
                Balcony(area: 2.53, perimeter: 6.40),
              ]
          ),
          Apartment(
              rooms: [
                ApartmentHall(area: 10.66, perimeter: 20.65),
                Saloon(area: 27.36, perimeter: 23.20, windows: []),
                Kitchen(area: 7.58, perimeter: 11.55, windows: []),
                NormalRoom(area: 7.45, perimeter: 10.95, windows: []),
                NormalRoom(area: 7.96, perimeter: 11.85, windows: []),
                NormalRoom(area: 12.11, perimeter: 15.15, windows: []),
                Bathroom(area: 4.87, perimeter: 9.05, windows: []),
                EscapeHallBathroom(area: 3.08, perimeter: 7.05, windows: []),
                Balcony(area: 2.53, perimeter: 6.40),
              ]
          )
        ],
      ),
      count: 9,
    ),
    Floor(
      no: 0,
      area: 166.68,
      perimeter: 59.6,
      heightWithSlab: 3.3,
      slabHeight: 0.3,
      isCeilingSlabHollow: true,
      thickWallLength: 86.2,
      thinWallLength: 15.5,
      sections: [
        CommonArea(
            rooms: [
              ElevatorShaft(area: 9.5, perimeter: 12.6),
              Stairs(area: 6.86, perimeter: 10.5),
              Stairs(area: 14.73, perimeter: 15.5),
              BuildingEntranceHall(area: 4.65, perimeter: 9.25),
            ]
        ),
        Apartment(
            rooms: [
              SaloonWithKitchen(area: 28.06, perimeter: 30.95, windows: [Window(width: 17.4, height: 2.5,)]),
              NormalRoom(area: 12.93, perimeter: 18.6, windows: []),
              Bathroom(area: 4.74, perimeter: 8.75, windows: []),
              EscapeHallBathroom(area: 3.37, perimeter: 7.35, windows: []),
            ]
        ),
        Apartment(
            rooms: [
              SaloonWithKitchen(area: 28.06, perimeter: 30.95, windows: []),
              NormalRoom(area: 12.93, perimeter: 18.6, windows: []),
              Bathroom(area: 4.74, perimeter: 8.75, windows: []),
              EscapeHallBathroom(area: 3.37, perimeter: 7.35, windows: []),
            ]
        )
      ],
    ),
    Floor(
      no: -1,
      area: 660.41,
      perimeter: 108.90,
      heightWithSlab: 3.3,
      slabHeight: 0.3,
      isCeilingSlabHollow: false,
      thickWallLength: 50,
      thinWallLength: 0,
      sections: [
        CommonArea(
            rooms: [
              ElevatorShaft(area: 9.5, perimeter: 12.6),
              Stairs(area: 6.86, perimeter: 10.5),
              Stairs(area: 14.73, perimeter: 15.5),
              BuildingFloorHall(area: 4.65, perimeter: 9.25, doors: [Door.fire]),
              FireEscapeHall(area: 3.08, perimeter: 7.05),
              ParkingArea(area: 500, perimeter: 120),
              TechnicalArea(area: 7.10, perimeter: 10.7),
              TechnicalArea(area: 7.25, perimeter: 10.8),
              TechnicalArea(area: 17, perimeter: 16.6),
              TechnicalArea(area: 52.6, perimeter: 33.6),
            ]
        )
      ],
    ),
  ];

  static List<Floor> selviliApt1Blok = [
    Floor(
      no: 0,
      area: 394.36,
      perimeter: 92.3,
      heightWithSlab: 3.3,
      slabHeight: 0.3,
      isCeilingSlabHollow: true,
      thickWallLength: 112,
      thinWallLength: 76.5,
      sections: [
        CommonArea(
          rooms: [
            BuildingEntranceHall(area: 41.13, perimeter: 38.60)
          ]
        ),
        Apartment(
          rooms: [
            Saloon(area: 51.93, perimeter: 30, windows: [Window(width: 7, height: 2.5)]),
            Kitchen(area: 17, perimeter: 16.7, windows: [Window(width: 2, height: 2.5)]),
            ApartmentHall(area: 19, perimeter: 20.70),
            ApartmentHall(area: 4.68, perimeter: 10.20),
            NormalRoom(area: 17.5, perimeter: 17, windows: [Window(width: 2, height: 2.5)]),
            NormalRoom(area: 25.9, perimeter: 22.3, windows: [Window(width: 3, height: 2.5)]),
            Bathroom(area: 5.1, perimeter: 9.40, windows: []),
            Bathroom(area: 6.30, perimeter: 10.20, windows: []),
            Balcony(area: 9, perimeter: 12.8),

            Saloon(area: 42, perimeter: 29.60 , windows: [Window(width: 2, height: 2.5)]),
            NormalRoom(area: 17.5, perimeter: 17, windows: [Window(width: 2, height: 2.5)]),
            NormalRoom(area: 28.3, perimeter: 23.50, windows: [Window(width: 3, height: 2.5)]),
            ApartmentHall(area: 4.68, perimeter: 10.20),
            Bathroom(area: 5.1, perimeter: 9.40, windows: []),
            Bathroom(area: 6.30, perimeter: 10.20, windows: []),
          ]
        )

      ],
    ),
    Floor(
      no: -1,
      area: 377.40,
      perimeter: 78.3,
      heightWithSlab: 3.3,
      slabHeight: 0.3,
      isCeilingSlabHollow: true,
      thickWallLength: 127.16,
      thinWallLength: 73.63,
      sections: [
        CommonArea(
          rooms: [
            BuildingFloorHall(area: 36.8, perimeter: 36.5),
            ElevatorShaft(area: 4, perimeter: 8),
            Stairs(area: 6.45, perimeter: 10.3),
            TechnicalArea(area: 15, perimeter: 16),
            TechnicalArea(area: 15, perimeter: 16),
            TechnicalArea(area: 15, perimeter: 16),
            TechnicalArea(area: 15, perimeter: 16),
            TechnicalArea(area: 15, perimeter: 16),
            TechnicalArea(area: 15, perimeter: 16),
          ]
        )
      ],
    ),
  ];
}

extension FloorExtension on Floor {
  String get floorName {
    return switch (no) {
      -4 => "4. Bodrum Kat",
      -3 => "3. Bodrum Kat",
      -2 => "2. Bodrum Kat",
      -1 => "1. Bodrum Kat",
      0 => "Zemin Kat",
      1 => "1. Kat",
      2 => "2. Kat",
      3 => "3. Kat",
      4 => "4. Kat",
      5 => "5. Kat",
      6 => "6. Kat",
      7 => "7. Kat",
      8 => "8. Kat",
      9 => "9. Kat",
      10 => "10. Kat",
      11 => "11. Kat",
      12 => "12. Kat",
      13 => "13. Kat",
      14 => "14. Kat",
      15 => "15. Kat",
      16 => "16. Kat",
      17 => "17. Kat",
      _ => throw Exception("Maximum number of floors exceeded")
    };
  }
}

extension FloorValidatorExtension on Floor {
  String validate() {
    if (no >= 17) {
      return "Maksimum kat sayısına ulaşıldı.";
    }
    if (no <= -4) {
      return "Maksimum bodrum kat sayısına ulaşıldı.";
    }
    if(area == 0) {
      return "Alan'ı hatalı girdiniz.";
    }
    return "";
  }
}