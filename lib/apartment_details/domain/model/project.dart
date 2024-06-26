import 'package:collection/collection.dart';
import 'package:kost/apartment_details/domain/model/project_constants.dart';
import 'package:kost/apartment_details/domain/model/project_variables.dart';

import 'floor/floor.dart';
import 'floor/floor_section.dart';
import 'floor/room/apartment_room.dart';
import 'floor/room/common_area_room.dart';
import 'floor/room/room.dart';

class Project {
  final String name;
  final ProjectConstants projectConstants;
  final ProjectVariables projectVariables;
  List<Floor> floors;

  Project({
    required this.name,
    required this.projectConstants,
    required this.projectVariables,
    required this.floors
  }) {
    floors = floors
        .sorted((a, b) => a.no.compareTo(b.no))
        .reversed
        .toList();
  }

  Project copyWith({
    String? name,
    ProjectConstants? projectConstants,
    ProjectVariables? projectVariables,
    List<Floor>? floors,
  }) {
    return Project(
      name: name ?? this.name,
      projectConstants: projectConstants ?? this.projectConstants,
      projectVariables: projectVariables ?? this.projectVariables,
      floors: floors ?? this.floors,
    );
  }


  static Project selviliApt1Blok = Project(
    name: "Selvili 1 Blok",
    projectConstants: const ProjectConstants(),
    projectVariables: const ProjectVariables(
      landArea: 1500,
      landPerimeter: 80,
      foundationArea: 377,
      foundationPerimeter: 78.3,
      foundationHeight: 1,
      excavationArea: 465,
      excavationPerimeter: 86.3,
      coreCurtainLength: 15,
      curtainsExceeding1MeterLength: 10,
      basementCurtainLength: 0,
      columnsLess1MeterPerimeter: 16,
      elevationTowerArea: 17.5,
      elevationTowerHeightWithoutSlab: 3,
    ),
    floors: [
      ...Floor.duplicateFloors(
          Floor(
            no: 1,
            area: 501.6,
            perimeter: 90.3,
            heightWithSlab: 3.3,
            slabHeight: 0.3,
            isCeilingSlabHollow: true,
            thickWallLength: 130.57,
            thinWallLength: 131.30,
            sections: [
              Apartment(
                  apartmentAreaRooms: [
                    ApartmentHall(area: 13, perimeter: 15.2),
                    ApartmentHall(area: 7, perimeter: 14.2),
                    Saloon(area: 70, perimeter: 36, windows: [Window(width: 8, height: 2.5)]),
                    Kitchen(area: 20, perimeter: 18, windows: [Window(width: 1.5, height: 2.5)]),
                    NormalRoom(
                        area: 10.45, perimeter: 13.10, windows: [Window(width: 1.5, height: 2.5)]),
                    NormalRoom(area: 6, perimeter: 10, windows: []),
                    NormalRoom(area: 15, perimeter: 16, windows: [Window(width: 1.5, height: 2.5)]),
                    NormalRoom(
                        area: 16.25, perimeter: 16.5, windows: [Window(width: 1.5, height: 2.5)]),
                    NormalRoom(area: 25, perimeter: 20.1, windows: [Window(width: 2, height: 2.5)]),
                    Wc(area: 3.75, perimeter: 8.5, windows: []),
                    Bathroom(area: 3.25, perimeter: 7.3, windows: []),
                    Bathroom(area: 7, perimeter: 10.6, windows: []),
                    Bathroom(area: 7, perimeter: 10.6, windows: []),
                    Balcony(area: 8, perimeter: 12),
                    Balcony(area: 3, perimeter: 7.6),
                    Balcony(area: 3, perimeter: 6.8),
                  ]
              ),
              CommonArea(
                  commonAreaRooms: [
                    BuildingFloorHall(area: 9, perimeter: 15),
                    ElevatorShaft(area: 4, perimeter: 8),
                    Stairs(area: 6.45, perimeter: 10.3),
                  ]
              ),
              Apartment(
                  apartmentAreaRooms: [
                    ApartmentHall(area: 13, perimeter: 15.2),
                    ApartmentHall(area: 7, perimeter: 14.2),
                    Saloon(area: 70, perimeter: 36, windows: [Window(width: 8, height: 2.5)]),
                    Kitchen(area: 20, perimeter: 18, windows: [Window(width: 1.5, height: 2.5)]),
                    NormalRoom(
                        area: 10.45, perimeter: 13.10, windows: [Window(width: 1.5, height: 2.5)]),
                    NormalRoom(area: 6, perimeter: 10, windows: []),
                    NormalRoom(area: 15, perimeter: 16, windows: [Window(width: 1.5, height: 2.5)]),
                    NormalRoom(
                        area: 16.25, perimeter: 16.5, windows: [Window(width: 1.5, height: 2.5)]),
                    NormalRoom(area: 25, perimeter: 20.1, windows: [Window(width: 2, height: 2.5)]),
                    Wc(area: 3.75, perimeter: 8.5, windows: []),
                    Bathroom(area: 3.25, perimeter: 7.3, windows: []),
                    Bathroom(area: 7, perimeter: 10.6, windows: []),
                    Bathroom(area: 7, perimeter: 10.6, windows: []),
                    Balcony(area: 8, perimeter: 12),
                    Balcony(area: 3, perimeter: 7.6),
                    Balcony(area: 3, perimeter: 6.8),
                  ]
              ),
            ],
          ),
          count: 3
      ),
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
          Apartment(
              apartmentAreaRooms: [
                Saloon(area: 51.93, perimeter: 30, windows: [Window(width: 7, height: 2.5)]),
                Kitchen(area: 17, perimeter: 16.7, windows: [Window(width: 2, height: 2.5)]),
                ApartmentHall(area: 19, perimeter: 20.70),
                ApartmentHall(area: 4.68, perimeter: 10.20),
                NormalRoom(area: 17.5, perimeter: 17, windows: [Window(width: 2, height: 2.5)]),
                NormalRoom(area: 25.9, perimeter: 22.3, windows: [Window(width: 3, height: 2.5)]),
                Bathroom(area: 5.1, perimeter: 9.40, windows: []),
                Bathroom(area: 6.30, perimeter: 10.20, windows: []),
                Balcony(area: 9, perimeter: 12.8),
              ]
          ),
          CommonArea(
              commonAreaRooms: [
                BuildingEntranceHall(area: 41.13, perimeter: 38.60),
                ElevatorShaft(area: 4, perimeter: 8),
                Stairs(area: 6.45, perimeter: 10.3),
              ]
          ),
          Apartment(
              apartmentAreaRooms: [
                Saloon(area: 51.93, perimeter: 30, windows: [Window(width: 7, height: 2.5)]),
                Kitchen(area: 17, perimeter: 16.7, windows: [Window(width: 2, height: 2.5)]),
                ApartmentHall(area: 19, perimeter: 20.70),
                ApartmentHall(area: 4.68, perimeter: 10.20),
                NormalRoom(area: 17.5, perimeter: 17, windows: [Window(width: 2, height: 2.5)]),
                NormalRoom(area: 25.9, perimeter: 22.3, windows: [Window(width: 3, height: 2.5)]),
                Bathroom(area: 5.1, perimeter: 9.40, windows: []),
                Bathroom(area: 6.30, perimeter: 10.20, windows: []),
                Balcony(area: 9, perimeter: 12.8),
              ]
          ),

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
          Apartment(
              apartmentAreaRooms: [
                Saloon(area: 42, perimeter: 29.60, windows: [Window(width: 2, height: 2.5)]),
                NormalRoom(area: 17.5, perimeter: 17, windows: [Window(width: 2, height: 2.5)]),
                NormalRoom(area: 28.3, perimeter: 23.50, windows: [Window(width: 3, height: 2.5)]),
                ApartmentHall(area: 4.68, perimeter: 10.20),
                Bathroom(area: 5.1, perimeter: 9.40, windows: []),
                Bathroom(area: 6.30, perimeter: 10.20, windows: []),
              ]
          ),
          Apartment(
              apartmentAreaRooms: [
                Saloon(area: 42, perimeter: 29.60, windows: [Window(width: 2, height: 2.5)]),
                NormalRoom(area: 17.5, perimeter: 17, windows: [Window(width: 2, height: 2.5)]),
                NormalRoom(area: 28.3, perimeter: 23.50, windows: [Window(width: 3, height: 2.5)]),
                ApartmentHall(area: 4.68, perimeter: 10.20),
                Bathroom(area: 5.1, perimeter: 9.40, windows: []),
                Bathroom(area: 6.30, perimeter: 10.20, windows: []),
              ]
          ),
          CommonArea(
              commonAreaRooms: [
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
    ],
  );

  static Project orelApt = Project(
      name: "Apartman",
      projectConstants: const ProjectConstants(
          automaticShutterNumber: 0
      ),
      projectVariables: const ProjectVariables(
        landArea: 866.59,
        landPerimeter: 124.45,
        foundationArea: 221.72,
        foundationPerimeter: 64.70,
        foundationHeight: 1,
        excavationArea: 295.22,
        excavationPerimeter: 72.7,
        coreCurtainLength: 17.57,
        curtainsExceeding1MeterLength: 4.5,
        basementCurtainLength: 64.7,
        columnsLess1MeterPerimeter: 11.28,
        elevationTowerArea: 23.94,
        elevationTowerHeightWithoutSlab: 3,
      ),
      floors: [
        ...Floor.duplicateFloors(
            Floor(
                no: 1,
                area: 325.52,
                perimeter: 76.7,
                heightWithSlab: 3.3,
                slabHeight: 0.3,
                isCeilingSlabHollow: true,
                thickWallLength: 105,
                thinWallLength: 82.38,
                sections: [
                  CommonArea(
                      commonAreaRooms: [
                        ElevatorShaft(area: 4.1, perimeter: 8.1),
                        Shaft(area: 1.27, perimeter: 6.1),
                        Stairs(area: 8.03, perimeter: 11.4),
                        BuildingFloorHall(area: 4.12, perimeter: 8.5)
                      ]
                  ),
                  Apartment(
                      apartmentAreaRooms: [
                        Saloon(
                            area: 43.44,
                            perimeter: 28,
                            windows: [
                              Window(width: 3, height: 2.5),
                              Window(width: 1, height: 2.5),
                              Window(width: 3.5, height: 2.5),
                            ]
                        ),
                        Kitchen(area: 13.6,
                            perimeter: 14.8,
                            windows: [Window(width: 1.5, height: 2.5)]),
                        ApartmentHall(area: 10.07, perimeter: 16.6),
                        ApartmentHall(area: 5.17, perimeter: 11.6),
                        NormalRoom(
                            area: 8.5,
                            perimeter: 11.8,
                            windows: [
                              Window(width: 1.2, height: 2.5)
                            ]
                        ),
                        NormalRoom(
                            area: 12.4,
                            perimeter: 14.2,
                            windows: [
                              Window(width: 1.5, height: 2.5)
                            ]
                        ),
                        NormalRoom(
                            area: 10,
                            perimeter: 13,
                            windows: [
                              Window(width: 1.5, height: 2.5)
                            ]
                        ),
                        NormalRoom(
                            area: 23.5,
                            perimeter: 22.5,
                            windows: [
                              Window(width: 2, height: 2.5)
                            ]
                        ),
                        Bathroom(
                            area: 3.22,
                            perimeter: 7.4,
                            windows: []
                        ),
                        Bathroom(
                            area: 6.32,
                            perimeter: 10.1,
                            windows: []
                        ),
                        Balcony(
                            area: 4.6,
                            perimeter: 8.8
                        )
                      ]
                  ),
                  Apartment(
                      apartmentAreaRooms: [
                        Saloon(
                            area: 43.44,
                            perimeter: 28,
                            windows: [
                              Window(width: 3, height: 2.5),
                              Window(width: 1, height: 2.5),
                              Window(width: 3.5, height: 2.5),
                            ]
                        ),
                        Kitchen(area: 13.6,
                            perimeter: 14.8,
                            windows: [Window(width: 1.5, height: 2.5)]),
                        ApartmentHall(area: 10.07, perimeter: 16.6),
                        ApartmentHall(area: 5.17, perimeter: 11.6),
                        NormalRoom(
                            area: 8.5,
                            perimeter: 11.8,
                            windows: [
                              Window(width: 1.2, height: 2.5)
                            ]
                        ),
                        NormalRoom(
                            area: 12.4,
                            perimeter: 14.2,
                            windows: [
                              Window(width: 1.5, height: 2.5)
                            ]
                        ),
                        NormalRoom(
                            area: 10,
                            perimeter: 13,
                            windows: [
                              Window(width: 1.5, height: 2.5)
                            ]
                        ),
                        NormalRoom(
                            area: 23.5,
                            perimeter: 22.5,
                            windows: [
                              Window(width: 2, height: 2.5)
                            ]
                        ),
                        Bathroom(
                            area: 3.22,
                            perimeter: 7.4,
                            windows: []
                        ),
                        Bathroom(
                            area: 6.32,
                            perimeter: 10.1,
                            windows: []
                        ),
                        Balcony(
                            area: 4.6,
                            perimeter: 8.8
                        )
                      ]
                  ),
                ]
            ),
            count: 4
        ),
        Floor(
            no: 0,
            area: 217.97,
            perimeter: 66.70,
            heightWithSlab: 4,
            slabHeight: 0.3,
            isCeilingSlabHollow: true,
            thickWallLength: 104.04,
            thinWallLength: 0,
            sections: [
              CommonArea(
                  commonAreaRooms: [
                    ElevatorShaft(area: 4.1, perimeter: 8.1),
                    Shaft(area: 1.27, perimeter: 6.1),
                    Stairs(area: 8.03, perimeter: 11.4),
                    Stairs(area: 3.95, perimeter: 9.9),
                    Stairs(area: 3.95, perimeter: 9.9),
                    BuildingEntranceHall(area: 14.03, perimeter: 18.70),
                    CommonAreaRoom(
                        name: "Dükkan 1",
                        area: 38.10,
                        perimeter: 27.6,
                        windows: [
                          Window(width: 4.25, height: 3),
                        ],
                        floorMaterial: FloorMaterial.ceramic,
                        wallMaterial: WallMaterial.painting,
                        ceilingMaterial: CeilingMaterial.drywall,
                        hasCovingPlaster: false,
                        hasFloorPlinth: false,
                        isFloorWet: false,
                        doors: []
                    ),
                    CommonAreaRoom(
                        name: "Dükkan 2",
                        area: 49.1,
                        perimeter: 35.9,
                        windows: [
                          Window(width: 4.25, height: 3),
                        ],
                        floorMaterial: FloorMaterial.ceramic,
                        wallMaterial: WallMaterial.painting,
                        ceilingMaterial: CeilingMaterial.drywall,
                        hasCovingPlaster: false,
                        hasFloorPlinth: false,
                        isFloorWet: false,
                        doors: []
                    ),
                    CommonAreaRoom(
                        name: "Dükkan 3",
                        area: 27.36,
                        perimeter: 25.40,
                        windows: [
                          Window(width: 2.5, height: 3),
                        ],
                        floorMaterial: FloorMaterial.ceramic,
                        wallMaterial: WallMaterial.painting,
                        ceilingMaterial: CeilingMaterial.drywall,
                        hasCovingPlaster: false,
                        hasFloorPlinth: false,
                        isFloorWet: false,
                        doors: []
                    ),
                    CommonAreaRoom(
                        name: "Dükkan 4",
                        area: 27.36,
                        perimeter: 25.40,
                        windows: [
                          Window(width: 2.5, height: 3),
                        ],
                        floorMaterial: FloorMaterial.ceramic,
                        wallMaterial: WallMaterial.painting,
                        ceilingMaterial: CeilingMaterial.drywall,
                        hasCovingPlaster: false,
                        hasFloorPlinth: false,
                        isFloorWet: false,
                        doors: []
                    ),
                    CommonAreaRoom(
                        name: "Dükkan 5",
                        area: 25.77,
                        perimeter: 23,
                        windows: [
                          Window(width: 2.5, height: 3),
                        ],
                        floorMaterial: FloorMaterial.ceramic,
                        wallMaterial: WallMaterial.painting,
                        ceilingMaterial: CeilingMaterial.drywall,
                        hasCovingPlaster: false,
                        hasFloorPlinth: false,
                        isFloorWet: false,
                        doors: []
                    ),
                  ]
              )
            ]
        ),
        Floor(
            no: -1,
            area: 221.72,
            perimeter: 64.70,
            heightWithSlab: 3.0,
            slabHeight: 0.15,
            isCeilingSlabHollow: false,
            thickWallLength: 42.85,
            thinWallLength: 0,
            sections: [
              CommonArea(
                  commonAreaRooms: [
                    ElevatorShaft(area: 4.1, perimeter: 8.1),
                    Shaft(area: 1.27, perimeter: 6.1),
                    Stairs(area: 8.03, perimeter: 11.4),
                    Stairs(area: 3.95, perimeter: 9.9),
                    Stairs(area: 3.95, perimeter: 9.9),
                    BuildingFloorHall(area: 14.53, perimeter: 23.2),
                    TechnicalArea(area: 4.8, perimeter: 9.2),
                    TechnicalArea(area: 4.8, perimeter: 9.2),
                    TechnicalArea(area: 6.9, perimeter: 10.9),
                    TechnicalArea(area: 29.60, perimeter: 22.8),
                    TechnicalArea(area: 43.92, perimeter: 29.5),
                    CommonAreaRoom(
                        name: "Dükkan Deposu 1",
                        area: 22.22,
                        perimeter: 20.9,
                        windows: [],
                        floorMaterial: FloorMaterial.ceramic,
                        wallMaterial: WallMaterial.painting,
                        ceilingMaterial: CeilingMaterial.drywall,
                        hasCovingPlaster: false,
                        hasFloorPlinth: false,
                        isFloorWet: false,
                        doors: [
                          Door.fire
                        ]
                    ),
                    CommonAreaRoom(
                        name: "Dükkan Deposu 2",
                        area: 45.98,
                        perimeter: 35.30,
                        windows: [],
                        floorMaterial: FloorMaterial.ceramic,
                        wallMaterial: WallMaterial.painting,
                        ceilingMaterial: CeilingMaterial.drywall,
                        hasCovingPlaster: false,
                        hasFloorPlinth: false,
                        isFloorWet: false,
                        doors: [
                          Door.fire
                        ]
                    ),
                  ]
              )

            ]
        ),
        Floor(
            no: -2,
            area: 221.72,
            perimeter: 64.70,
            heightWithSlab: 3.0,
            slabHeight: 0.15,
            isCeilingSlabHollow: false,
            thickWallLength: 42.85,
            thinWallLength: 0,
            sections: []
        ),
      ]
  );
}