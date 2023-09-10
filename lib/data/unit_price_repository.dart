import '../common/model/unit_price.dart';
import '../common/model/unit_price_category.dart';

class UnitPriceRepository {

  // Ayın 8'i olan fiyatları bozma, yeni fiyatları üzerine ekle.

  static List<UnitPrice> unitPrices = [
    //Zeminci - Deniz ✓
    UnitPrice(
        category: UnitPriceCategory.shutCrete,
        amount: 2700,
        fixedAmount: 30000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),

    //Hafriyat - Habip ✓
    UnitPrice(
        category: UnitPriceCategory.excavation,
        amount: 450,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.breaker,
        amount: 2000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)
    ),
    UnitPrice(
      category: UnitPriceCategory.foundationStabilizationGravel,
      amount: 330,
      currency: Currency.lira,
      dateTime: DateTime(2023, 08),
    ),

    //Kalıp Yaşar ✓
    UnitPrice(
        category: UnitPriceCategory.reinforcedConcreteWorkmanshipWithPlywood,
        amount: 800,
        currency: Currency.lira,
        dateTime: DateTime(2023, 07)
    ),

    //Beton Albayrak ✓
    UnitPrice(
        category: UnitPriceCategory.c16Concrete,
        amount: 2150,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.c30Concrete,
        amount: 2250,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.c35Concrete,
        amount: 2300,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.c40Concrete,
        amount: 2400,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),

    //İnşaat Demiri - İnternet ✓
    UnitPrice(
        category: UnitPriceCategory.s420Steel,
        amount: 19000/1.18,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),

    //Su İzolasyon - Tunç ✓
    UnitPrice(
        category: UnitPriceCategory.proofBitumenMembrane,
        amount: 9,
        currency: Currency.dollar,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.bitumenSliding,
        amount: 8,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.cementSliding,
        amount: 6.5,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.cementBasedFlexInsulation,
        amount: 7.5,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.drainPlate,
        amount: 1.15,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08),
    ),

    //Çeşitli Malzeme - Can ✓
    UnitPrice(
        category: UnitPriceCategory.eps14Dns,
        amount: 960,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.aeratedConcreteYtong,
        amount: 1500,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),

    //Duvarcı - Şener ✓
    UnitPrice(
        category: UnitPriceCategory.aeratedConcreteLabor,
        amount: 80,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),

    //Çatıcı - Aydın (Fiyat zaten çalışıyor şu an)
    UnitPrice(
        category: UnitPriceCategory.steelConstructionBraasRoof,
        amount: 3000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01),
    ),

    //Yağmur İskele - Mesut ✓
    UnitPrice(
        category: UnitPriceCategory.steelScaffolding,
        amount: 208,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),

    //Doğrama - Rehau Seyid ✓
    UnitPrice(
        category: UnitPriceCategory.windowJoineryRehau,
        amount: 300,
        currency: Currency.euro,
        dateTime: DateTime(2023, 01),
    ),

    //Cepheci ✓
    UnitPrice(
        category: UnitPriceCategory.sinterFlex4Facade,
        amount: 1935,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.precast3FacadePlaster1Facade,
        amount: 154.8,
        currency: Currency.dollar,
        dateTime: DateTime(2023, 08),
    ),

    //Alçı Sıvacı - Abdullah ✓
    UnitPrice(
        category: UnitPriceCategory.plaster,
        amount: 175,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),

    //Boyacı - Nebi ✓
    UnitPrice(
        category: UnitPriceCategory.painting,
        amount: 130,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),

    //Alçıpancı - Bedir ✓
    UnitPrice(
        category: UnitPriceCategory.drywall,
        amount: 250,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.covingPlaster,
        amount: 75,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),

    //Şapçı - (Şapçı Halitten fiyat al)
    UnitPrice(
        category: UnitPriceCategory.screed300Doses,
        amount: 156,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01),
    ),

    //Mermerci - Osman ✓
    UnitPrice(
        category: UnitPriceCategory.marbleFloorBilecik,
        amount: 1200,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.marbleStepBilecik,
        amount: 1000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.marbleWindowsillBilecik,
        amount: 1000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.quartzCountertopCimstone,
        amount: 4000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),

    //Banyo - Orhan, İnternet ✓
    UnitPrice(
        category: UnitPriceCategory.ceramicTileVitraVersus,
        amount: 500,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.sinkVitra,
        amount: 2000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.sinkBatteryVitra,
        amount: 1500,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.concealedCisternVitra,
        amount: 3500,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.showerBatteryVitra,
        amount: 2000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.kitchenFaucetAndSinkFranke,
        amount: 12500,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.paddleBoxBuiltInOvenCookTopDishwasherFranke,
        amount: 8000 + 10000 + 7000 + 15000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.automaticBarrier,
        amount: 35000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
      category: UnitPriceCategory.automaticShutter,
      amount: 100000,
      currency: Currency.lira,
      dateTime: DateTime(2023, 08),
    ),

    //Sıcak Demirci - Selçuk, İnternet ✓
    UnitPrice(
        category: UnitPriceCategory.wroughtIronRailing,
        amount: 4500,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.aluminumRailing,
        amount: 1000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.trapezoidalSheetCurtain,
        amount: 1000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),

    //Parke - şerifoğlu ✓
    UnitPrice(
        category: UnitPriceCategory.laminatedSerifoglu,
        amount: 52,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08),
    ),

    //Kapıcı - Ahmet ✓
    UnitPrice(
        category: UnitPriceCategory.steelDoorKale,
        amount: 29400,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.entranceDoor,
        amount: 14250,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.ironFireDoor,
        amount: 4950,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),

    //Oda kapısı - Artella (Şu an çalışıyor), StillDoor(Kapı fiyatı gelecek bu unit price'ı markalı yap)
    UnitPrice(
        category: UnitPriceCategory.lacqueredDoorArtella,
        amount: 8000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01),
    ),

    //Mutfak dolabı - Hacker, Aster ✓
    UnitPrice(
        category: UnitPriceCategory.shinyLacqueredKitchenCupboardAster,
        amount: 500,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.matteLacqueredKitchenCupboardAster,
        amount: 435,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08),
    ),

    //Marangoz - Ramazan (Markasız olanlar bunun altında dursun)
    UnitPrice(
        category: UnitPriceCategory.lacqueredCabinet,
        amount: 5000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01),
    ),
    UnitPrice(
        category: UnitPriceCategory.lacqueredFloorPlinth,
        amount: 100,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01),
    ),

    //Mekanik Tesisatçı - Halil ✓
    UnitPrice(
        category: UnitPriceCategory.mechanicalInfrastructure,
        amount: 120000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08),
    ),

    //Vrf - Klima ✓
    UnitPrice(
      category: UnitPriceCategory.airConditionerArcelik,
      amount: 15000,
      currency: Currency.lira,
      dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.vrfMultiSplitMitsubishiElectric,
        amount: 800,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.ventilation,
        amount: 10,
        currency: Currency.dollar,
        dateTime: DateTime(2023, 08),
    ),

    //Modüler su deposu ✓
    UnitPrice(
        category: UnitPriceCategory.galvanize25TonWaterTankEsinoks,
        amount: 5500,
        currency: Currency.dollar,
        dateTime: DateTime(2023, 01),
    ),

    //Asansör - Kone ✓
    UnitPrice(
        category: UnitPriceCategory.elevation10PersonKone,
        fixedAmount: 30000,
        amount: 1000,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.elevation6PersonKone,
        fixedAmount: 20000,
        amount: 1000,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08),
    ),

    //Araç lifti - Can ✓
    UnitPrice(
        category: UnitPriceCategory.carLift,
        fixedAmount: 30000,
        amount: 5000,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08),
    ),

    //Düşakabin ✓
    UnitPrice(
        category: UnitPriceCategory.showerHuppe100x100,
        amount: 18000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)
    ),

    //Elektrikçi - İhsan ✓
    UnitPrice(
        category: UnitPriceCategory.electricalInfrastructure,
        amount: 140000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),

    //Jeneratör - Aksa (kontrol et Kenan'a sor)
    UnitPrice(
        category: UnitPriceCategory.generatorAksa160,
        amount: 16282,
        currency: Currency.euro,
        dateTime: DateTime(2023, 01)),

    //Kendin hesapla ✓
    UnitPrice(
        category: UnitPriceCategory.averageGarden,
        amount: 3000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.interlockingPavingStone,
        amount: 400,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.mobilizationDemobilization,
        amount: 220000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.crane55Ton,
        amount: 3500,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.siteSafety,
        amount: 15000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.siteExpenses,
        amount: 12000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.sergeantGrossWage,
        amount: 30000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.siteChiefGrossWage,
        amount: 60000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.projectsFeesPayments,
        amount: 1000000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
  ];

  List<UnitPrice> getAllUnitPrices() {
    return unitPrices;
  }
}
