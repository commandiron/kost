import '../domain/model/unit_price/currency.dart';
import '../domain/model/unit_price/unit_price.dart';
import '../domain/model/unit_price/unit_price_category.dart';

class UnitPriceRepository {
  static List<UnitPrice> unitPrices = [
    //Deniz, alındı.
    UnitPrice(
        category: UnitPriceCategory.shutCrete,
        amount: 2700,
        fixedAmount: 30000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)
    ),
    //Habip
    UnitPrice(
        category: UnitPriceCategory.excavation,
        amount: 450,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    //Habip
    UnitPrice(
        category: UnitPriceCategory.breaker,
        amount: 1500,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    //Kalıp Yaşar - duvarsız sor
    UnitPrice(
        category: UnitPriceCategory.plywood,
        amount: 900,
        currency: Currency.lira,
        dateTime: DateTime(2023, 07)),
    //Beton Albayrak
    UnitPrice(
        category: UnitPriceCategory.c16Concrete,
        amount: 1500,
        currency: Currency.lira,
        dateTime: DateTime(2023, 07)),
    UnitPrice(
        category: UnitPriceCategory.c30Concrete,
        amount: 1800,
        currency: Currency.lira,
        dateTime: DateTime(2023, 07)),
    UnitPrice(
        category: UnitPriceCategory.c35Concrete,
        amount: 1900,
        currency: Currency.lira,
        dateTime: DateTime(2023, 07)),
    UnitPrice(
        category: UnitPriceCategory.c40Concrete,
        amount: 2000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 07)
    ),
    UnitPrice(
        category: UnitPriceCategory.s420Steel,
        amount: 19000/1.18,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)
    ),
    //Tunç - İzolasyon
    UnitPrice(
        category: UnitPriceCategory.doubleLayerBitumenMembrane,
        amount: 224.47,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.bitumenSliding,
        amount: 155,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.drainPlate,
        amount: 30,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    //Can Malzeme
    UnitPrice(
        category: UnitPriceCategory.foundationStabilizationGravel,
        amount: 450,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.eps,
        amount: 815,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.aeratedConcreteMaterial,
        amount: 1500,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    //Duvarcı
    UnitPrice(
        category: UnitPriceCategory.aeratedConcreteLabor,
        amount: 60,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.steelConstructionBraasRoof,
        amount: 3000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    //Çatıcı - fiyat zaten çalışıyor şu an.
    UnitPrice(
        category: UnitPriceCategory.steelScaffolding,
        amount: 208,
        currency: Currency.lira,
        dateTime: DateTime(2023, 07)),
    //Rehau doğramacı, bunun euro teklifi vardı onun üzerinden gidebilirsin.
    UnitPrice(
        category: UnitPriceCategory.windowJoineryRehau,
        amount: 6000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    //Selçuk veya internet
    UnitPrice(
        category: UnitPriceCategory.wroughtIronRailing,
        amount: 3000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    //Cepheci - bunun birim fiyatı nasıl hesaplanacak bir düşün
    UnitPrice(
        category: UnitPriceCategory.ceramicFacade,
        amount: 600,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.precastFacade,
        amount: 800,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    //Alçı Sıvacı Abdullah
    UnitPrice(
        category: UnitPriceCategory.plaster,
        amount: 100,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    //Nebi
    UnitPrice(
        category: UnitPriceCategory.painting,
        amount: 110,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    //İnternet
    UnitPrice(
        category: UnitPriceCategory.cementBasedFlexInsulation,
        amount: 200,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    //Alçıpancı Bedir
    UnitPrice(
        category: UnitPriceCategory.drywall,
        amount: 230,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.covingPlaster,
        amount: 55,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.screed,
        amount: 156,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.marbleFloorBilecik,
        amount: 1000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.marbleStepBilecik,
        amount: 850,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.marbleWindowsillBilecik,
        amount: 850,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.aluminumRailing,
        amount: 1000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.ceramicTileEge,
        amount: 500,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.laminatedSerifoglu,
        amount: 52,
        currency: Currency.euro,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.steelDoorKale,
        amount: 16000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.entranceDoor,
        amount: 9750,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.ironFireDoor,
        amount: 4200,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.lacqueredDoor,
        amount: 8000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.lacqueredKitchenCupboard,
        amount: 8000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.quartzCountertopCimstone,
        amount: 3500,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.lacqueredCabinet,
        amount: 5000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.lacqueredFloorPlinth,
        amount: 100,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.mechanicalInfrastructure,
        amount: 100000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.airConditionerArcelik,
        amount: 10000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.ventilation,
        amount: 180,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.galvanize25TonWaterTankEsinoks,
        amount: 110000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.elevation10PersonKone,
        fixedAmount: 30000,
        amount: 1000,
        currency: Currency.euro,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.elevation6PersonKone,
        fixedAmount: 20000,
        amount: 1000,
        currency: Currency.euro,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.sinkVitra,
        amount: 3000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.sinkBatteryVitra,
        amount: 3000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.concealedCisternVitra,
        amount: 3000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.showerHuppe,
        amount: 9000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.showerBatteryVitra,
        amount: 3000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.kitchenFaucetAndSinkFranke,
        amount: 10000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.electricalInfrastructure,
        amount: 85000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.generatorAksa160,
        amount: 16282,
        currency: Currency.euro,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.fullSetFranke,
        amount: 41000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.averageGarden,
        amount: 2000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.interlockingPavingStone,
        amount: 360,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.carLift,
        fixedAmount: 25000,
        amount: 5000,
        currency: Currency.euro,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.automaticBarrier,
        amount: 25000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.trapezoidalSheetCurtain,
        amount: 850,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.mobilizationDemobilization,
        amount: 200000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.crane10Ton,
        amount: 5000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.siteSafety,
        amount: 15000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 07)),
    UnitPrice(
        category: UnitPriceCategory.siteExpenses,
        amount: 10000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.sergeantGrossWage,
        amount: 30000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.projectManagerGrossWage,
        amount: 60000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.projectsFeesPayments,
        amount: 1000000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
  ];

  List<UnitPrice> getAllUnitPrices() {
    return unitPrices;
  }
}
