import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kost/data/app_data.dart';
import 'package:kost/domain/calculator/detailed/detailed_quantity_calculator.dart';
import 'package:kost/domain/calculator/detailed/project_constants.dart';
import 'package:kost/domain/calculator/quantity_calculator.dart';
import 'package:kost/domain/model/currency.dart';
import 'package:kost/domain/model/unit_price_template.dart';

import '../../presentation/model/cost_item.dart';
import '../calculator/detailed/floor.dart';
import '../model/category.dart';
import '../model/unit_price.dart';
import 'project_event.dart';
import 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(
    ProjectState(
      quantityCalculator: InitialQuantityCalculator(),
      unitPrices: const [],
      currencyRates: DefaultCurrencyRates(),
      costTemplate: EmptyCostTemplate(),
      uiCostItems: const [],
      formattedGrandTotalTRY: ""
    ),
  ){
    on<Init>((event, emit) {
      add(const CreateQuantityCalculator());
      add(const FetchUnitPrices());
      add(const FetchCurrencyRates());
      add(const FetchCostTemplate());
      _refresh();
    });
    on<CreateQuantityCalculator>((event, emit) {
      final quantityCalculator = DetailedQuantityCalculator(
        projectConstants: ProjectConstants(),
        excavationLength: 103.07,
        excavationArea: 581.47,
        floors: [
          ..._duplicateFloors(
            Floor(
              ceilingArea: 190,
              ceilingLength: 62.8,
              area: 188.75,
              length: 62.8,
              height: 3.3,
              outerWallLength: 100,
              innerWallLength: 100,
              type: FloorType.k3,
            ),
            9
          ),
          Floor(
            ceilingArea: 188.75,
            ceilingLength: 62.8,
            area: 188,
            length: 62.3,
            height: 3.3,
            outerWallLength: 100,
            innerWallLength: 100,
            type: FloorType.k2,
          ),
          Floor(
            ceilingArea: 188,
            ceilingLength: 62.3,
            area: 177.15,
            length: 61.3,
            height: 3.3,
            outerWallLength: 100,
            innerWallLength: 100,
            type: FloorType.k1,
          ),
          Floor(
            ceilingArea: 177.15,
            ceilingLength: 61.3,
            area: 177.15,
            length: 61.3,
            height: 3.3,
            outerWallLength: 100,
            innerWallLength: 100,
            type: FloorType.z,
          ),
          Floor(
            ceilingArea: 477,
            ceilingLength: 94.42,
            area: 477,
            length: 94.42,
            height: 3.15,
            outerWallLength: 100,
            innerWallLength: 100,
            type: FloorType.b1,
          ),
        ],
        foundationArea: 477,
        foundationLength: 94.42,
        foundationHeight: 1,
      );
      emit(state.copyWith(quantityCalculator: quantityCalculator));
    });
    on<FetchUnitPrices>((event, emit) {
      emit(state.copyWith(unitPrices: AppData.unitPrices));
    });
    on<FetchCurrencyRates>((event, emit) {
      emit(state.copyWith(currencyRates: DefaultCurrencyRates()));
    });
    on<FetchCostTemplate>((event, emit) {
      emit(state.copyWith(costTemplate: RoughConstructionCostTemplate()));
    });
    on<CreateCostTable>((event, emit) {

      if(!_isAllEnabledUnitPriceCategoriesInUnitPrices) {
        throw Exception("All enabled unit prices in the template are NOT included in fetched unit prices."); //Handle
      }

      final costItems = _createFilteredCostItems(
        unitPrices: state.unitPrices,
        enabledUnitPriceCategories: state.costTemplate.enabledUnitPriceCategories,
        quantityCalculator: state.quantityCalculator,
        currencyRates: state.currencyRates
      );

      final uiCostItems = costItems.map((costItem) => costItem.toUiCostItem()).toList();
      final formattedGrandTotalTRY = "${NumberFormat("#,##0.00", "tr_TR").format(_calculateGrandTotal(costItems))} TL";
      emit(state.copyWith(uiCostItems: uiCostItems, formattedGrandTotalTRY: formattedGrandTotalTRY));
    });
    on<ReplaceUnitPriceCategory>((event, emit) {
      for (var enabledUnitPriceCategory in state.costTemplate.enabledUnitPriceCategories) {
        if(enabledUnitPriceCategory.jobCategory == event.unitPriceCategory.jobCategory) {
          state.costTemplate.enabledUnitPriceCategories.remove(enabledUnitPriceCategory);
          state.costTemplate.enabledUnitPriceCategories.add(event.unitPriceCategory);
        }
      }
      _refresh();
    });
  }

  void _refresh() {
    add(const CreateCostTable());
  }

  List<Floor> _duplicateFloors(Floor floor, int count) {
    final List<Floor> duplicatedFloors = [];
    for(var i = 1 ; i <= count; i++ ) {
      duplicatedFloors.add(floor);
    }
    return duplicatedFloors;
  }

  bool get _isAllEnabledUnitPriceCategoriesInUnitPrices {
    for (var enabledUnitPriceCategory in state.costTemplate.enabledUnitPriceCategories) {
      if(!state.unitPrices.map((e) => e.category).toList().contains(enabledUnitPriceCategory)) {
        return false;
      }
    }
    return true;
  }

  List<CostItem> _createFilteredCostItems(
    {
      required List<UnitPrice> unitPrices,
      required List<UnitPriceCategory> enabledUnitPriceCategories,
      required QuantityCalculator quantityCalculator,
      required CurrencyRates currencyRates,
    }
  ) {
    List<CostItem> costItems = [];

    for (var unitPrice in unitPrices) {
      if(enabledUnitPriceCategories.contains(unitPrice.category)) {
        final costItem = CostItem(
          unitPrice: unitPrice,
          quantity: quantityCalculator.getQuantityFromUnitPriceCategory(unitPrice.category),
          currencyRates: currencyRates
        );
        final sameCategoryCostItem = costItems.firstWhereOrNull((costItem) => costItem.unitPrice.category == unitPrice.category);
        if(sameCategoryCostItem != null) {
          if(sameCategoryCostItem.unitPrice.dateTime.isBefore(unitPrice.dateTime)) {
            costItems.remove(sameCategoryCostItem);
            costItems.add(costItem);
          }
        } else {
          costItems.add(costItem);
        }
      }
    }

    return costItems;
  }

  double _calculateGrandTotal(List<CostItem> costItems) {
    return costItems.map((costItem) => costItem.totalPriceTRY).toList().fold(0, (p, c) => p + c);
  }

  void init() {
    add(const Init());
  }
}
