import 'package:collection/collection.dart';
import 'package:kost/domain/calculator/detailed/project_constants.dart';
import 'package:kost/domain/model/unit_price/unit.dart';
import 'package:kost/domain/model/unit_price/unit_price.dart';

import '../../calculator/detailed/floor.dart';
import '../../helper/formattedNumber.dart';
import '../cost/cost.dart';
import '../unit_price/currency.dart';
import 'job.dart';

abstract class CostCalculator {
  List<Job> jobs;
  final String name;
  final ProjectConstants projectConstants;
  final double landArea;
  final double landPerimeter;
  final double excavationArea;
  final double excavationPerimeter;
  final double coreCurtainLength;
  final double curtainsExceeding1MeterLength;
  final double basementCurtainLength;
  final double columnsLess1MeterPerimeter;
  final double elevationTowerArea;
  final double elevationTowerHeightWithoutSlab;
  List<Floor> floors;
  final double foundationArea;
  final double foundationPerimeter;
  final double foundationHeight;

  CostCalculator(
    {
      this.jobs = const [],
      required this.name,
      required this.projectConstants,
      required this.landArea,
      required this.landPerimeter,
      required this.excavationArea,
      required this.excavationPerimeter,
      required this.coreCurtainLength,
      required this.curtainsExceeding1MeterLength,
      required this.basementCurtainLength,
      required this.columnsLess1MeterPerimeter,
      required this.elevationTowerArea,
      required this.elevationTowerHeightWithoutSlab,
      required this.floors,
      required this.foundationArea,
      required this.foundationPerimeter,
      required this.foundationHeight,
    }
  );

  List<Cost> calculate({required List<UnitPrice> unitPricePool, required CurrencyRates currencyRates, required List<Cost> oldCosts}){
    List<Cost> costs = [];

    for (var job in jobs) {

      if(job.disable) {
        continue;
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

      final quantity = job.quantity;
      final quantityText = getFormattedNumber(number: quantity);

      final quantityUnitText = unitPrice.unit.symbol;

      final quantityExplanationText = job.quantityExplanation;

      final fixedPriceTRY = quantity != 0 ? unitPrice.fixedAmount * unitPrice.currency.toLiraRate(currencyRates) : 0;
      final priceTRY = unitPrice.amount * quantity * unitPrice.currency.toLiraRate(currencyRates);
      final totalPriceTRY = fixedPriceTRY + priceTRY;
      final formattedTotalPriceTRY = getFormattedNumber(number: totalPriceTRY, unit: "TL");

      final cost = Cost(
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
        visible: oldCosts.isNotEmpty
          ? oldCosts.firstWhereOrNull((cost) => cost.jobId == job.id)?.visible ?? true
          : true
      );

      costs.add(cost);
    }
    return costs;
  }
}

class ApartmentCostCalculator extends CostCalculator {
  ApartmentCostCalculator({
    super.name = "Apartman Maliyeti",
    required super.projectConstants,
    required super.landArea,
    required super.landPerimeter,
    required super.excavationArea,
    required super.excavationPerimeter,
    required super.coreCurtainLength,
    required super.curtainsExceeding1MeterLength,
    required super.basementCurtainLength,
    required super.columnsLess1MeterPerimeter,
    required super.elevationTowerArea,
    required super.elevationTowerHeightWithoutSlab,
    required super.floors,
    required super.foundationArea,
    required super.foundationPerimeter,
    required super.foundationHeight
  }){
    final roughConstructionCostCalculator = RoughConstructionCostCalculator(projectConstants: projectConstants, landArea: landArea, landPerimeter: landPerimeter, excavationArea: excavationArea, excavationPerimeter: excavationPerimeter, coreCurtainLength: coreCurtainLength, curtainsExceeding1MeterLength: curtainsExceeding1MeterLength, basementCurtainLength: basementCurtainLength, columnsLess1MeterPerimeter: columnsLess1MeterPerimeter, elevationTowerArea: elevationTowerArea, elevationTowerHeightWithoutSlab: elevationTowerHeightWithoutSlab, floors: floors, foundationArea: foundationArea, foundationPerimeter: foundationPerimeter, foundationHeight: foundationHeight);
    final roofCostCalculator = RoofCostCalculator(projectConstants: projectConstants, landArea: landArea, landPerimeter: landPerimeter, excavationArea: excavationArea, excavationPerimeter: excavationPerimeter, coreCurtainLength: coreCurtainLength, curtainsExceeding1MeterLength: curtainsExceeding1MeterLength, basementCurtainLength: basementCurtainLength, columnsLess1MeterPerimeter: columnsLess1MeterPerimeter, elevationTowerArea: elevationTowerArea, elevationTowerHeightWithoutSlab: elevationTowerHeightWithoutSlab, floors: floors, foundationArea: foundationArea, foundationPerimeter: foundationPerimeter, foundationHeight: foundationHeight);
    final interiorCostCalculator = InteriorCostCalculator(projectConstants: projectConstants, landArea: landArea, landPerimeter: landPerimeter, excavationArea: excavationArea, excavationPerimeter: excavationPerimeter, coreCurtainLength: coreCurtainLength, curtainsExceeding1MeterLength: curtainsExceeding1MeterLength, basementCurtainLength: basementCurtainLength, columnsLess1MeterPerimeter: columnsLess1MeterPerimeter, elevationTowerArea: elevationTowerArea, elevationTowerHeightWithoutSlab: elevationTowerHeightWithoutSlab, floors: floors, foundationArea: foundationArea, foundationPerimeter: foundationPerimeter, foundationHeight: foundationHeight);
    final landscapeCostCalculator = LandscapeCostCalculator(projectConstants: projectConstants, landArea: landArea, landPerimeter: landPerimeter, excavationArea: excavationArea, excavationPerimeter: excavationPerimeter, coreCurtainLength: coreCurtainLength, curtainsExceeding1MeterLength: curtainsExceeding1MeterLength, basementCurtainLength: basementCurtainLength, columnsLess1MeterPerimeter: columnsLess1MeterPerimeter, elevationTowerArea: elevationTowerArea, elevationTowerHeightWithoutSlab: elevationTowerHeightWithoutSlab, floors: floors, foundationArea: foundationArea, foundationPerimeter: foundationPerimeter, foundationHeight: foundationHeight);
    final generalExpensesCostCalculator = GeneralExpensesCostCalculator(projectConstants: projectConstants, landArea: landArea, landPerimeter: landPerimeter, excavationArea: excavationArea, excavationPerimeter: excavationPerimeter, coreCurtainLength: coreCurtainLength, curtainsExceeding1MeterLength: curtainsExceeding1MeterLength, basementCurtainLength: basementCurtainLength, columnsLess1MeterPerimeter: columnsLess1MeterPerimeter, elevationTowerArea: elevationTowerArea, elevationTowerHeightWithoutSlab: elevationTowerHeightWithoutSlab, floors: floors, foundationArea: foundationArea, foundationPerimeter: foundationPerimeter, foundationHeight: foundationHeight);
    jobs = [
      ...roughConstructionCostCalculator.jobs,
      ...roofCostCalculator.jobs,
      ...interiorCostCalculator.jobs,
      ...landscapeCostCalculator.jobs,
      ...generalExpensesCostCalculator.jobs
    ];
  }
}

class RoughConstructionCostCalculator extends CostCalculator {
  RoughConstructionCostCalculator(
    {
      super.name = "Kaba İnşaat Maliyeti",
      required super.projectConstants,
      required super.landArea,
      required super.landPerimeter,
      required super.excavationArea,
      required super.excavationPerimeter,
      required super.coreCurtainLength,
      required super.curtainsExceeding1MeterLength,
      required super.basementCurtainLength,
      required super.columnsLess1MeterPerimeter,
      required super.elevationTowerArea,
      required super.elevationTowerHeightWithoutSlab,
      required super.floors,
      required super.foundationArea,
      required super.foundationPerimeter,
      required super.foundationHeight,
    }
  ){
    jobs = [
      Shoring(quantity: shoringArea, quantityExplanation: shoringAreaExplanation),
      Excavation(quantity: excavationVolume, quantityExplanation: excavationVolumeExplanation),
      Breaker(quantity: breakerHour, quantityExplanation: breakerHourExplanation),
      FoundationStabilization(quantity: foundationStabilizationVolume, quantityExplanation: foundationStabilizationWeightExplanation),
      SubFoundationConcrete(quantity: 100, quantityExplanation: "quantityExplanation"),
      ConcreteFormWork(quantity: 100, quantityExplanation: "quantityExplanation"),
      PouringConcrete(quantity: 100, quantityExplanation: "quantityExplanation"),
      Rebar(quantity: 100, quantityExplanation: "quantityExplanation"),
      HollowFloorFilling(quantity: 100, quantityExplanation: "quantityExplanation"),
      FoundationWaterproofing(quantity: 100, quantityExplanation: "quantityExplanation"),
      CurtainWaterproofing(quantity: 100, quantityExplanation: "quantityExplanation"),
      CurtainProtectionBeforeFilling(quantity: 100, quantityExplanation: "quantityExplanation"),
      WallMaterial(quantity: 100, quantityExplanation: "quantityExplanation"),
      WallWorkmanShip(quantity: 100, quantityExplanation: "quantityExplanation"),
    ];
  }

  List<Floor> get _basementFloors {
    final basementFloors = floors.where((element) => element.no < 0).toList();
    if (basementFloors.isEmpty) {
      throw Exception("No basement floor");
    }
    return basementFloors;
  }

  double get _basementsHeight {
    return _basementFloors.map((floor) => floor.fullHeight).fold(0.0, (p, c) => p + c);
  }

  double get _excavationHeight {
    return projectConstants.stabilizationHeight
      + projectConstants.leanConcreteHeight
      + projectConstants.insulationConcreteHeight
      + foundationHeight
      + _basementsHeight;
  }

  double get shoringArea {
    return excavationPerimeter * _excavationHeight;
  }
  String get shoringAreaExplanation {
    return "Hafriyat çevre uzunluğu: $excavationPerimeter x Hafriyat yüksekliği: $_excavationHeight";
  }

  double get excavationVolume {
    return excavationArea * _excavationHeight;
  }
  String get excavationVolumeExplanation {
    return "Hafriyat alanı: $excavationArea x Hafriyat yüksekliği: $_excavationHeight";
  }

  double get breakerHour {
    return excavationArea * _excavationHeight * projectConstants.breakerHourForOneCubicMeterMediumRockExcavation;
  }
  String get breakerHourExplanation {
    return "Hafriyat alanı: $excavationArea x Hafriyat yüksekliği: $_excavationHeight x Bir m3 orta sertlikte kaya içeren hafriyat için kırıcı çalışma süresi: ${projectConstants.breakerHourForOneCubicMeterMediumRockExcavation}";
  }

  double get foundationStabilizationVolume {
    return excavationArea * projectConstants.stabilizationHeight * projectConstants.gravelTonForOneCubicMeter;
  }

  String get foundationStabilizationWeightExplanation {
    return "Hafriyat alanı: $excavationArea x Temel altı stabilizasyon malzemesi yüksekliği: ${projectConstants.stabilizationHeight} x 1 m3 mıcır: ${projectConstants.gravelTonForOneCubicMeter} ton";
  }
}

class RoofCostCalculator extends CostCalculator {
  RoofCostCalculator({
    super.name = "Çatı Maliyeti",
    required super.projectConstants,
    required super.landArea,
    required super.landPerimeter,
    required super.excavationArea,
    required super.excavationPerimeter,
    required super.coreCurtainLength,
    required super.curtainsExceeding1MeterLength,
    required super.basementCurtainLength,
    required super.columnsLess1MeterPerimeter,
    required super.elevationTowerArea,
    required super.elevationTowerHeightWithoutSlab,
    required super.floors,
    required super.foundationArea,
    required super.foundationPerimeter,
    required super.foundationHeight
  }){
    jobs = [
      Roofing(quantity: 100, quantityExplanation: "quantityExplanation")
    ];
  }
}

class FacadeCostCalculator extends CostCalculator {
  FacadeCostCalculator({
    super.name = "Cephe Maliyeti",
    required super.projectConstants,
    required super.landArea,
    required super.landPerimeter,
    required super.excavationArea,
    required super.excavationPerimeter,
    required super.coreCurtainLength,
    required super.curtainsExceeding1MeterLength,
    required super.basementCurtainLength,
    required super.columnsLess1MeterPerimeter,
    required super.elevationTowerArea,
    required super.elevationTowerHeightWithoutSlab,
    required super.floors,
    required super.foundationArea,
    required super.foundationPerimeter,
    required super.foundationHeight
  }){
    jobs = [
      FacadeScaffolding(quantity: 100, quantityExplanation: "quantityExplanation"),
      Windows(quantity: 100, quantityExplanation: "quantityExplanation"),
      FacadeRails(quantity: 100, quantityExplanation: "quantityExplanation"),
      FacadeSystem(quantity: 100, quantityExplanation: "quantityExplanation")
    ];
  }
}

class InteriorCostCalculator extends CostCalculator {
  InteriorCostCalculator({
    super.name = "İç İmalat Maliyeti",
    required super.projectConstants,
    required super.landArea,
    required super.landPerimeter,
    required super.excavationArea,
    required super.excavationPerimeter,
    required super.coreCurtainLength,
    required super.curtainsExceeding1MeterLength,
    required super.basementCurtainLength,
    required super.columnsLess1MeterPerimeter,
    required super.elevationTowerArea,
    required super.elevationTowerHeightWithoutSlab,
    required super.floors,
    required super.foundationArea,
    required super.foundationPerimeter,
    required super.foundationHeight
  }){
    jobs = [
      InteriorPlastering(quantity: 100, quantityExplanation: "quantityExplanation"),
      InteriorPainting(quantity: 100, quantityExplanation: "quantityExplanation"),
      InteriorWaterproofing(quantity: 100, quantityExplanation: "quantityExplanation"),
      CeilingCovering(quantity: 100, quantityExplanation: "quantityExplanation"),
      CovingPlaster(quantity: 100, quantityExplanation: "quantityExplanation"),
      Screeding(quantity: 100, quantityExplanation: "quantityExplanation"),
      Marble(quantity: 100, quantityExplanation: "quantityExplanation"),
      MarbleStep(quantity: 100, quantityExplanation: "quantityExplanation"),
      MarbleWindowsill(quantity: 100, quantityExplanation: "quantityExplanation"),
      StairRailings(quantity: 100, quantityExplanation: "quantityExplanation"),
      CeramicTile(quantity: 100, quantityExplanation: "quantityExplanation"),
      ParquetTile(quantity: 100, quantityExplanation: "quantityExplanation"),
      SteelDoor(quantity: 100, quantityExplanation: "quantityExplanation"),
      EntranceDoor(quantity: 100, quantityExplanation: "quantityExplanation"),
      FireDoor(quantity: 100, quantityExplanation: "quantityExplanation"),
      WoodenDoor(quantity: 100, quantityExplanation: "quantityExplanation"),
      KitchenCupboard(quantity: 100, quantityExplanation: "quantityExplanation"),
      KitchenCounter(quantity: 100, quantityExplanation: "quantityExplanation"),
      CoatCabinet(quantity: 100, quantityExplanation: "quantityExplanation"),
      BathroomCabinet(quantity: 100, quantityExplanation: "quantityExplanation"),
      FloorPlinth(quantity: 100, quantityExplanation: "quantityExplanation"),
      MechanicalInfrastructure(quantity: 100, quantityExplanation: "quantityExplanation"),
      AirConditioner(quantity: 100, quantityExplanation: "quantityExplanation"),
      Ventilation(quantity: 100, quantityExplanation: "quantityExplanation"),
      WaterTank(quantity: 100, quantityExplanation: "quantityExplanation"),
      Elevation(quantity: 100, quantityExplanation: "quantityExplanation", selectedUnitPriceCategory: UnitPriceCategory.elevation10PersonKone),
      Elevation(quantity: 100, quantityExplanation: "quantityExplanation", selectedUnitPriceCategory: UnitPriceCategory.elevation6PersonKone),
      Sink(quantity: 100, quantityExplanation: "quantityExplanation"),
      SinkBattery(quantity: 100, quantityExplanation: "quantityExplanation"),
      ConcealedCistern(quantity: 100, quantityExplanation: "quantityExplanation"),
      Shower(quantity: 100, quantityExplanation: "quantityExplanation"),
      ShowerBattery(quantity: 100, quantityExplanation: "quantityExplanation"),
      KitchenFaucetAndSink(quantity: 100, quantityExplanation: "quantityExplanation"),
      ElectricalInfrastructure(quantity: 100, quantityExplanation: "quantityExplanation"),
      Generator(quantity: 100, quantityExplanation: "quantityExplanation"),
      HouseholdAppliances(quantity: 100, quantityExplanation: "quantityExplanation"),
    ];
  }
}

class LandscapeCostCalculator extends CostCalculator {
  LandscapeCostCalculator({
    super.name = "Peysaj Maliyeti",
    required super.projectConstants,
    required super.landArea,
    required super.landPerimeter,
    required super.excavationArea,
    required super.excavationPerimeter,
    required super.coreCurtainLength,
    required super.curtainsExceeding1MeterLength,
    required super.basementCurtainLength,
    required super.columnsLess1MeterPerimeter,
    required super.elevationTowerArea,
    required super.elevationTowerHeightWithoutSlab,
    required super.floors,
    required super.foundationArea,
    required super.foundationPerimeter,
    required super.foundationHeight
  }){
    jobs = [
      LandScapeGarden(quantity: 100, quantityExplanation: "quantityExplanation"),
      OutdoorParkingTile(quantity: 100, quantityExplanation: "quantityExplanation"),
      CarLift(quantity: 100, quantityExplanation: "quantityExplanation"),
      AutomaticBarrier(quantity: 100, quantityExplanation: "quantityExplanation"),
    ];
  }
}
class GeneralExpensesCostCalculator extends CostCalculator {
  GeneralExpensesCostCalculator({
    super.name = "Genel Giderler",
    required super.projectConstants,
    required super.landArea,
    required super.landPerimeter,
    required super.excavationArea,
    required super.excavationPerimeter,
    required super.coreCurtainLength,
    required super.curtainsExceeding1MeterLength,
    required super.basementCurtainLength,
    required super.columnsLess1MeterPerimeter,
    required super.elevationTowerArea,
    required super.elevationTowerHeightWithoutSlab,
    required super.floors,
    required super.foundationArea,
    required super.foundationPerimeter,
    required super.foundationHeight
  }){
    jobs = [
      EnclosingTheLand(quantity: 100, quantityExplanation: "quantityExplanation"),
      MobilizationDemobilization(quantity: 100, quantityExplanation: "quantityExplanation"),
      Crane(quantity: 100, quantityExplanation: "quantityExplanation"),
      SiteSafety(quantity: 100, quantityExplanation: "quantityExplanation"),
      SiteExpenses(quantity: 100, quantityExplanation: "quantityExplanation"),
      Sergeant(quantity: 100, quantityExplanation: "quantityExplanation"),
      SiteChief(quantity: 100, quantityExplanation: "quantityExplanation"),
      ProjectsFeesPayments(quantity: 100, quantityExplanation: "quantityExplanation"),
    ];
  }
}