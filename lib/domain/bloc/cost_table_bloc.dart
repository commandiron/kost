import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/data/unit_price_repository.dart';
import 'package:kost/domain/calculator/detailed/project_constants.dart';
import 'package:kost/domain/calculator/detailed/room.dart';
import 'package:kost/domain/calculator/detailed/window.dart';
import 'package:kost/domain/helper/formattedNumber.dart';
import 'package:kost/domain/model/unit_price/currency.dart';
import 'package:kost/domain/model/job/job_quantity_calculator.dart';
import 'package:kost/domain/model/cost/cost.dart';
import 'package:kost/domain/model/unit_price/unit.dart';
import 'package:kost/presentation/cost_table/cost_table_screen.dart';

import '../calculator/detailed/floor.dart';
import '../model/job/job.dart';
import '../model/unit_price/unit_price.dart';
import 'cost_table_event.dart';
import 'cost_table_state.dart';

class CostTableBloc extends Bloc<CostTableEvent, CostTableState> {

  void init() {
    add(const Init());
  }

  CostTableBloc()
    : super(
      CostTableState(
        jobQuantityCalculator: ApartmentJobsQuantityCalculator(
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
                        count: 1
                    ),
                  ],
                  rooms: [
                    ElevatorShaft(area: 8.61, perimeter: 12.8),
                    Shaft(area: 1.05, perimeter: 5.2,),
                    FloorHall(area: 8.1, perimeter: 13.8),
                    FireEscapeHall(area: 11.1, perimeter: 20.9),
                    Stairs(area: 7.2, perimeter: 10.9),
                    Stairs(area: 5.1, perimeter: 10.9),

                    ApartmentEntree(area: 0, perimeter: 0),
                    SaloonWithKitchen(area: 39.38, perimeter: 35.3,),
                    NormalRoom(area: 18.37, perimeter: 18.5),
                    NormalRoom(area: 10.76, perimeter: 13.6),
                    Bathroom(area: 6.41, perimeter: 11.1),
                    Bathroom(area: 3.16, perimeter: 7.5),

                    ApartmentEntree(area: 0, perimeter: 0),
                    SaloonWithKitchen(area: 35.7, perimeter: 34.2,),
                    NormalRoom(area: 15.56, perimeter: 16.2),
                    NormalRoom(area: 10.06, perimeter: 13.2),
                    Bathroom(area: 5.63, perimeter: 10.10),
                    Bathroom(area: 3.16, perimeter: 7.5),
                  ],
                ),
                11
            ),
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
                    count: 1
                ),
              ],
              rooms: [
                ElevatorShaft(area: 8.61, perimeter: 12.8),
                Shaft(area: 1.05, perimeter: 5.2,),
                FireEscapeHall(area: 11.1, perimeter: 20.9),
                BuildingHall(area: 15.92, perimeter: 21.1),
                Stairs(area: 7.2, perimeter: 10.9),
                Stairs(area: 5.1, perimeter: 10.9),

                ApartmentEntree(area: 0, perimeter: 0),
                SaloonWithKitchen(area: 33.40, perimeter: 30.65,),
                NormalRoom(area: 12.43, perimeter: 14.2),
                Bathroom(area: 4.26, perimeter: 8.6),
                Bathroom(area: 3.16, perimeter: 7.5),

                ApartmentEntree(area: 0, perimeter: 0),
                SaloonWithKitchen(area: 33.40, perimeter: 30.65,),
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
                Shaft(area: 1.05, perimeter: 5.2,),
                Stairs(area: 7.2, perimeter: 10.9),
                Stairs(area: 5.1, perimeter: 10.9),

                FloorHall(area: 6.07, perimeter: 11.1, doors: [Door(count: 1, doorType: DoorType.fire)]),
                FireEscapeHall(area: 17.62, perimeter: 20.9, doors: [Door(count: 1, doorType: DoorType.fire)]),
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
        unitPricePool: const [],
        currencyRates: ManualCurrencyRates(),
        costs: const [],
        categoryVisibilities: const {},
        formattedSubTotalsTRY: const {},
        formattedGrandTotalTRY: ""
      ),
    ) {
    on<Init>((event, emit) {
      final unitPricePool = _fetchUnitPricePool();
      //Fetch currency rates
      emit(state.copyWith(unitPricePool: unitPricePool,));
      _refresh();
    });
    on<CreateCostTable>((event, emit) {
      final List<Cost> costs = [];
      for (var job in state.jobQuantityCalculator.jobs) {
        final cost = _jobToCost(job: job, unitPricePool: state.unitPricePool, currencyRates: state.currencyRates);
        if(cost != null) {
          costs.add(cost);
        }
      }

      final Map<MainCategory, String> formattedSubTotalsTRY = {};
      final Map<MainCategory, bool> categoryVisibilities = {};
      final mainCategorySet = costs.map((cost) => cost.mainCategory).toSet();

      for (var mainCategory in mainCategorySet) {
        categoryVisibilities.putIfAbsent(mainCategory, () => true);
        final subTotal = _calculateSubTotal(costs, mainCategory);
        formattedSubTotalsTRY.putIfAbsent(mainCategory, () => getFormattedNumber(number: subTotal, unit: "TL"));
      }


      final grandTotal = _calculateGrandTotal(costs);
      final formattedGrandTotalTRY = getFormattedNumber(number: grandTotal, unit: "TL");

      emit(
        state.copyWith(
          costs: costs,
          categoryVisibilities: categoryVisibilities,
          formattedSubTotalsTRY: formattedSubTotalsTRY,
          formattedGrandTotalTRY: formattedGrandTotalTRY,
        )
      );
    });
    on<ExpandCollapseMainCategory>((event, emit) {
      final categoryVisibilities = state.categoryVisibilities;
      categoryVisibilities[event.mainCategory] = !(categoryVisibilities[event.mainCategory] ?? false);
      emit(state.copyWith(categoryVisibilities: Map.of(categoryVisibilities)));
    });
    on<ExpandCollapseAllMainCategory>((event, emit) {
      final categoryVisibilities = state.categoryVisibilities;
      if(categoryVisibilities.values.any((visible) => visible)) {
        categoryVisibilities.updateAll((key, value) => value = false);
      } else {
        categoryVisibilities.updateAll((key, value) => value = true);
      }
      emit(state.copyWith(categoryVisibilities: Map.of(categoryVisibilities)));
    });
    on<ReplaceUnitPrice>((event, emit) {
      state.jobQuantityCalculator.jobs.firstWhere((element) => element.id == event.jobId).selectedUnitPriceId = event.selectedUnitPriceId;
      _refresh();
    });
    on<DeleteJob>((event, emit) {
      state.jobQuantityCalculator.jobs.removeWhere((job) => job.id == event.jobId);
      _refresh();
    });
    on<ChangeQuantityManually>((event, emit) {
      final quantity = parseFormattedNumber(value: event.quantityText);
      state.jobQuantityCalculator.jobs.firstWhere((e) => e.id == event.jobId).quantity = quantity;
      _refresh();
    });
    //Quantity Details Screen
    on<FloorAreaChanged>((event, emit) {
      // final floorArea = parseFormattedNumber(value: event.floorAreaText);
      // state.quantityCalculator.floors[event.index].area = floorArea;
    });
    on<CalculateCost>((event, emit) {
      _refresh();
      Navigator.of(event.context).pushNamed(CostTableScreen.route);
    });
  }

  final UnitPriceRepository _unitPriceRepository = UnitPriceRepository();

  List<UnitPrice> _fetchUnitPricePool() {
    return _unitPriceRepository.getAllUnitPrices();
  }

  void _refresh() {
    add(const CreateCostTable());
  }

  Cost? _jobToCost({required Job job, required List<UnitPrice> unitPricePool, required CurrencyRates currencyRates}) {

    if(job.disable) {
      return null;
    }

    final UnitPrice? unitPrice;
    if(job.selectedUnitPriceId != null) {
      unitPrice = unitPricePool.firstWhere((unitPrice) => unitPrice.id == job.selectedUnitPriceId);
    } else {
      final unitPrices = unitPricePool.where((unitPrice) => unitPrice.category == job.selectedUnitPriceCategory);
      unitPrice = unitPrices.reduce((current, next) => current.dateTime.isAfter(next.dateTime) ? current : next);
    }

    final unitPriceNameText = unitPrice.nameTr;

    final formattedFixedAmount = getFormattedNumber(
        number: unitPrice.fixedAmount,
        unit: unitPrice.currency.symbol);
    final formattedAmount = getFormattedNumber(
        number: unitPrice.amount,
        unit: "${unitPrice.currency.symbol}/${unitPrice.unit.symbol}");

    final unitAmountText = unitPrice.fixedAmount != 0
        ? "$formattedFixedAmount + $formattedAmount"
        : formattedAmount;

    final quantityText = getFormattedNumber(number: job.quantity);

    final quantityUnitText = unitPrice.unit.symbol;

    final quantityExplanationText = job.quantityExplanation;

    final fixedPriceTRY = job.quantity != 0 ? unitPrice.fixedAmount * unitPrice.currency.toLiraRate(currencyRates) : 0;
    final priceTRY = unitPrice.amount * job.quantity * unitPrice.currency.toLiraRate(currencyRates);
    final totalPriceTRY = fixedPriceTRY + priceTRY;
    final formattedTotalPriceTRY = getFormattedNumber(number: totalPriceTRY, unit: "TL");

    return Cost(
      mainCategory: job.mainCategory,
      jobId: job.id,
      jobName: job.nameTr,
      enabledUnitPrices: unitPricePool.where((unitPrice) => job.enabledUnitPriceCategories.contains(unitPrice.category)).toList(),
      unitPriceNameText: unitPriceNameText,
      unitPriceAmountText: unitAmountText,
      quantityText: quantityText,
      quantityUnitText: quantityUnitText,
      quantityExplanationText: quantityExplanationText,
      formattedTotalPriceTRY: formattedTotalPriceTRY,
      totalPriceTRY: totalPriceTRY,
    );
  }

  double _calculateSubTotal(List<Cost> costs, MainCategory mainCategory) {
    final categorizedCosts = costs
        .where((cost) => cost.mainCategory == mainCategory)
        .toList();
    return categorizedCosts
        .map((e) => e.totalPriceTRY)
        .toList()
        .fold(0.0, (p, c) => p + c);
  }

  double _calculateGrandTotal(List<Cost> costs) {
    return costs
        .map((cost) => cost.totalPriceTRY)
        .toList()
        .fold(0, (p, c) => p + c);
  }
}