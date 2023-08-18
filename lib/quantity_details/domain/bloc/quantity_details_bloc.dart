import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/common/extension/formatted_number.dart';
import 'package:kost/quantity_details/domain/bloc/quantity_details_event.dart';
import 'package:kost/quantity_details/domain/bloc/quantity_details_state.dart';

import '../model/calculator/floor.dart';
import '../model/calculator/job_calculator.dart';
import '../model/calculator/project_constants.dart';
import '../model/calculator/room.dart';
import '../model/calculator/window.dart';
import '../../../cost_table/presentation/cost_table_screen.dart';

class QuantityDetailsBloc extends Bloc<QuantityDetailsEvent, QuantityDetailsState> {

  QuantityDetailsBloc() : super(
    QuantityDetailsState(
      jobCalculator: ApartmentJobsCalculator(
        projectConstants: ProjectConstants(),
        landArea: 806.24,
        landPerimeter: 117.93,
        excavationArea: 576.52,
        excavationPerimeter: 102.46,
        coreCurtainLength: 19.36,
        curtainsExceeding1MeterLength: 15.7,
        basementCurtainLength: 108.12,
        columnsLess1MeterPerimeter: 9,
        elevationTowerArea: 30,
        elevationTowerHeightWithoutSlab: 3,
        floors: [
          ...Floor.duplicateFloors(
              Floor(
                no: 1,
                ceilingArea: 213,
                ceilingPerimeter: 64.3,
                fullHeight: 3.3,
                area: 213,
                perimeter: 64.3,
                heightWithoutSlab: 3,
                thickWallLength: 72.97,
                thinWallLength: 36.28,
                isCeilingHollowSlab: true,
                windows: [
                  Window(
                      width: 17,
                      height: 2.5,
                      hasRailing: true,
                      hasWindowsill: true,
                      count: 1),
                ],
                rooms: [
                  ElevatorShaft(area: 8.61, perimeter: 12.8),
                  Shaft(
                    area: 1.05,
                    perimeter: 5.2,
                  ),
                  FloorHall(area: 8.1, perimeter: 13.8),
                  FireEscapeHall(area: 11.1, perimeter: 20.9),
                  Stairs(area: 7.2, perimeter: 10.9),
                  Stairs(area: 5.1, perimeter: 10.9),
                  ApartmentEntree(area: 0, perimeter: 0),
                  SaloonWithKitchen(
                    area: 39.38,
                    perimeter: 35.3,
                  ),
                  NormalRoom(area: 18.37, perimeter: 18.5),
                  NormalRoom(area: 10.76, perimeter: 13.6),
                  Bathroom(area: 6.41, perimeter: 11.1),
                  Bathroom(area: 3.16, perimeter: 7.5),
                  ApartmentEntree(area: 0, perimeter: 0),
                  SaloonWithKitchen(
                    area: 35.7,
                    perimeter: 34.2,
                  ),
                  NormalRoom(area: 15.56, perimeter: 16.2),
                  NormalRoom(area: 10.06, perimeter: 13.2),
                  Bathroom(area: 5.63, perimeter: 10.10),
                  Bathroom(area: 3.16, perimeter: 7.5),
                ],
              ),
              11),
          Floor(
            no: 0,
            ceilingArea: 177.15,
            ceilingPerimeter: 61.3,
            fullHeight: 3.3,
            area: 177.15,
            perimeter: 61.3,
            heightWithoutSlab: 3,
            thickWallLength: 66.29,
            thinWallLength: 21.67,
            isCeilingHollowSlab: true,
            windows: [
              Window(
                  width: 14,
                  height: 2.5,
                  hasRailing: true,
                  hasWindowsill: true,
                  count: 1),
            ],
            rooms: [
              ElevatorShaft(area: 8.61, perimeter: 12.8),
              Shaft(
                area: 1.05,
                perimeter: 5.2,
              ),
              FireEscapeHall(area: 11.1, perimeter: 20.9),
              BuildingHall(area: 15.92, perimeter: 21.1),
              Stairs(area: 7.2, perimeter: 10.9),
              Stairs(area: 5.1, perimeter: 10.9),
              ApartmentEntree(area: 0, perimeter: 0),
              SaloonWithKitchen(
                area: 33.40,
                perimeter: 30.65,
              ),
              NormalRoom(area: 12.43, perimeter: 14.2),
              Bathroom(area: 4.26, perimeter: 8.6),
              Bathroom(area: 3.16, perimeter: 7.5),
              ApartmentEntree(area: 0, perimeter: 0),
              SaloonWithKitchen(
                area: 33.40,
                perimeter: 30.65,
              ),
              NormalRoom(area: 12.43, perimeter: 14.2),
              Bathroom(area: 4.26, perimeter: 8.6),
              Bathroom(area: 3.16, perimeter: 7.5),
            ],
          ),
          Floor(
            no: -1,
            ceilingArea: 477,
            ceilingPerimeter: 94.42,
            fullHeight: 3.15,
            area: 477,
            perimeter: 94.42,
            heightWithoutSlab: 3,
            thickWallLength: 39.13,
            thinWallLength: 0,
            isCeilingHollowSlab: false,
            windows: [],
            rooms: [
              ElevatorShaft(area: 8.61, perimeter: 12.8),
              Shaft(
                area: 1.05,
                perimeter: 5.2,
              ),
              Stairs(area: 7.2, perimeter: 10.9),
              Stairs(area: 5.1, perimeter: 10.9),
              FloorHall(
                  area: 6.07,
                  perimeter: 11.1,
                  doors: [Door(count: 1, doorType: DoorType.fire)]),
              FireEscapeHall(
                  area: 17.62,
                  perimeter: 20.9,
                  doors: [Door(count: 1, doorType: DoorType.fire)]),
              ParkingArea(area: 296.25, perimeter: 94.82),
              TechnicalArea(area: 7.10, perimeter: 10.7),
              TechnicalArea(area: 7.25, perimeter: 10.8),
              TechnicalArea(area: 17, perimeter: 16.6),
              TechnicalArea(area: 52.6, perimeter: 33.6),
            ],
          ),
        ],
        foundationArea: 477,
        foundationPerimeter: 94.42,
        foundationHeight: 1,
      ),
    ),
  ){
    on<FloorAreaChanged>((event, emit) {
      final floorArea = event.floorAreaText.toNumber();
      state.jobCalculator.floors.firstWhere((floor) => floor.no == event.no).area = floorArea;
    });
    on<FloorDelete>((event, emit) {
      int? removedNo;
      state.jobCalculator.floors.removeWhere(
        (floor) {
          if(floor.no == event.no) {
            removedNo = floor.no;
            return true;
          }
          return false;
        }
      );

      if(removedNo != null) {
        for (var floor in state.jobCalculator.floors) {
          if(floor.no > removedNo!) {
            if(removedNo! > 0) {
              floor.no -= 1;
            }
          }
        }
      }
    });
    on<CalculateCost>((event, emit) {

      //Validate...

      Navigator.of(event.context).pushNamed(
        CostTableScreen.route,
        arguments: state.jobCalculator.createJobs()
      );
    });
  }
}