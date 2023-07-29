import '../domain/model/unit_price/currency.dart';
import '../domain/model/unit_price/unit_price.dart';
import '../domain/model/unit_price/unit_price_category.dart';

class UnitPriceRepository {
  static List<UnitPrice> unitPrices = [
    //Zeminci - Deniz ✓
    UnitPrice(
        category: UnitPriceCategory.shutCrete,
        amount: 2700,
        fixedAmount: 30000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)
    ),

    //Hafriyat - Habip ✓
    UnitPrice(
        category: UnitPriceCategory.excavation,
        amount: 450,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.breaker,
        amount: 2000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),

    //Kalıp Yaşar ✓
    UnitPrice(
        category: UnitPriceCategory.plywood,
        amount: 800,
        currency: Currency.lira,
        dateTime: DateTime(2023, 07)),

    //Beton Albayrak ✓
    UnitPrice(
        category: UnitPriceCategory.c16Concrete,
        amount: 2150,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.c30Concrete,
        amount: 2250,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.c35Concrete,
        amount: 2300,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.c40Concrete,
        amount: 2400,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)
    ),

    //İnşaat Demiri - İnternet ✓
    UnitPrice(
        category: UnitPriceCategory.s420Steel,
        amount: 19000/1.18,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)
    ),

    //Su İzolasyon - Tunç
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

    //Çeşitli Malzeme - Can
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
    UnitPrice(
        category: UnitPriceCategory.cementBasedFlexInsulation,
        amount: 200,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Duvarcı - Şener ✓
    UnitPrice(
        category: UnitPriceCategory.aeratedConcreteLabor,
        amount: 80,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),

    //Çatıcı - Aydın (Fiyat zaten çalışıyor şu an)
    UnitPrice(
        category: UnitPriceCategory.steelConstructionBraasRoof,
        amount: 3000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Yağmur İskele - Mesut ✓
    UnitPrice(
        category: UnitPriceCategory.steelScaffolding,
        amount: 208,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),

    //Doğrama - Rehau Seyid (Bunun euro teklifi vardı onun üzerinden gidebilirsin, kontrol et)
    UnitPrice(
        category: UnitPriceCategory.windowJoineryRehau,
        amount: 6000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Cepheci - (Bunun birim fiyatı nasıl hesaplanacak bir düşün)
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

    //Alçı Sıvacı - Abdullah
    UnitPrice(
        category: UnitPriceCategory.plaster,
        amount: 100,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Boyacı - Nebi
    UnitPrice(
        category: UnitPriceCategory.painting,
        amount: 110,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Alçıpancı - Bedir
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

    //Şapçı -
    UnitPrice(
        category: UnitPriceCategory.screed,
        amount: 156,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Mermerci - Osman
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
        category: UnitPriceCategory.quartzCountertopCimstone,
        amount: 3500,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Banyo - Orhan, İnternet ✓
    UnitPrice(
        category: UnitPriceCategory.ceramicTileVitraVersus,
        amount: 500,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.sinkVitra,
        amount: 2000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.sinkBatteryVitra,
        amount: 1500,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.concealedCisternVitra,
        amount: 2500,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.showerBatteryVitra,
        amount: 2000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.kitchenFaucetAndSinkFranke,
        amount: 12500,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.paddleBoxBuiltInOvenCookTopDishwasherFranke,
        amount: 8000 + 10000 + 7000 + 15000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.automaticBarrier,
        amount: 35000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),

    //Sıcak Demirci - Selçuk, İnternet ✓
    UnitPrice(
        category: UnitPriceCategory.wroughtIronRailing,
        amount: 4500,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.aluminumRailing,
        amount: 1000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.trapezoidalSheetCurtain,
        amount: 1000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),

    //Parke - şerifoğlu ✓
    UnitPrice(
        category: UnitPriceCategory.laminatedSerifoglu,
        amount: 52,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08)),

    //Kapıcı - Ahmet
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

    //Oda kapısı - StillDoor (Kapı fiyatı gelecek bu unit price'ı markalı yap)
    UnitPrice(
        category: UnitPriceCategory.lacqueredDoor,
        amount: 8000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Mutfak dolabı - Ramazan, Hacker, Aster ✓
    UnitPrice(
        category: UnitPriceCategory.shinyLacqueredKitchenCupboardAster,
        amount: 500,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.matteLacqueredKitchenCupboardAster,
        amount: 435,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08)),

    //Marangoz - Ramazan (Markasız olanlar bunun altında dursun)
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

    //Mekanik Tesisatçı - Halil
    UnitPrice(
        category: UnitPriceCategory.mechanicalInfrastructure,
        amount: 100000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Vrf klima - Erdinç (Fiyat vermişti multi split felan onuda ekle Mitshubishi)
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

    //Modüler su deposu - Esinoks (Eski fiyatlardan gidebilirsin)
    UnitPrice(
        category: UnitPriceCategory.galvanize25TonWaterTankEsinoks,
        amount: 110000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Asansör - Kone ✓
    UnitPrice(
        category: UnitPriceCategory.elevation10PersonKone,
        fixedAmount: 30000,
        amount: 1000,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.elevation6PersonKone,
        fixedAmount: 20000,
        amount: 1000,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08)),

    //Araç lifti - Can ✓
    UnitPrice(
        category: UnitPriceCategory.carLift,
        fixedAmount: 30000,
        amount: 5000,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08)),

    //Düşakabin - Hüppe (Eski fiyatlardan git)
    UnitPrice(
        category: UnitPriceCategory.showerHuppe,
        amount: 9000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Elektrikçi - İhsan
    UnitPrice(
        category: UnitPriceCategory.electricalInfrastructure,
        amount: 85000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Jeneratör - Aksa (Eski fiyatlardan git kontrol et)
    UnitPrice(
        category: UnitPriceCategory.generatorAksa160,
        amount: 16282,
        currency: Currency.euro,
        dateTime: DateTime(2023, 01)),

    //Kendin hesapla
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
