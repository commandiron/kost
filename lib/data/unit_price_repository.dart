import '../domain/model/unit_price/currency.dart';
import '../domain/model/unit_price/unit.dart';
import '../domain/model/unit_price/unit_price.dart';

class UnitPriceRepository {

  // Ayın 8'i olan fiyatları bozma, yeni fiyatları üzerine ekle.

  static List<UnitPrice> unitPrices = [
    //Zeminci - Deniz ✓
    UnitPrice(
        category: UnitPriceCategory.shutCrete,
        nameTr: "Shutcrete",
        amount: 2700,
        fixedAmount: 30000,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),

    //Hafriyat - Habip ✓
    UnitPrice(
        category: UnitPriceCategory.excavation,
        nameTr: "Hafriyat",
        amount: 450,
        currency: Currency.lira,
        unit: Unit.cubicMeters,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.breaker,
        nameTr: "Kırıcı",
        amount: 2000,
        currency: Currency.lira,
        unit: Unit.hour,
        dateTime: DateTime(2023, 08)
    ),
    UnitPrice(
      category: UnitPriceCategory.foundationStabilizationGravel,
      nameTr: "Mıcır",
      amount: 330,
      currency: Currency.lira,
      unit: Unit.ton,
      dateTime: DateTime(2023, 08),
    ),

    //Kalıp Yaşar ✓
    UnitPrice(
        category: UnitPriceCategory.plywood,
        nameTr: "Plywood",
        amount: 800,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 07)
    ),

    //Beton Albayrak ✓
    UnitPrice(
        category: UnitPriceCategory.c16Concrete,
        nameTr: "C16 Beton",
        amount: 2150,
        currency: Currency.lira,
        unit: Unit.cubicMeters,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.c30Concrete,
        nameTr: "C30 Beton",
        amount: 2250,
        currency: Currency.lira,
        unit: Unit.cubicMeters,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.c35Concrete,
        nameTr: "C35 Beton",
        amount: 2300,
        currency: Currency.lira,
        unit: Unit.cubicMeters,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.c40Concrete,
        nameTr: "C40 Beton",
        amount: 2400,
        currency: Currency.lira,
        unit: Unit.cubicMeters,
        dateTime: DateTime(2023, 08),
    ),

    //İnşaat Demiri - İnternet ✓
    UnitPrice(
        category: UnitPriceCategory.s420Steel,
        nameTr: "S420 İnşaat Demiri",
        amount: 19000/1.18,
        currency: Currency.lira,
        unit: Unit.ton,
        dateTime: DateTime(2023, 08),
    ),

    //Su İzolasyon - Tunç ✓
    UnitPrice(
        category: UnitPriceCategory.proofBitumenMembrane,
        nameTr: "Bitüm Esaslı Proof Membran",
        amount: 9,
        currency: Currency.dollar,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.bitumenSliding,
        nameTr: "Bitüm Esaslı Sürme İzolasyon",
        amount: 8,
        currency: Currency.euro,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.cementSliding,
        nameTr: "Çimento Esaslı Kristalize Sürme İzolasyon",
        amount: 6.5,
        currency: Currency.euro,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.cementBasedFlexInsulation,
        nameTr: "Çimento Esaslı Tam Elastik Sürme İzolasyon",
        amount: 7.5,
        currency: Currency.euro,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.drainPlate,
        nameTr: "Drenaj Levhası",
        amount: 1.15,
        currency: Currency.euro,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),

    //Çeşitli Malzeme - Can ✓
    UnitPrice(
        category: UnitPriceCategory.eps14Dns,
        nameTr: "14 Dansite Eps",
        amount: 960,
        currency: Currency.lira,
        unit: Unit.cubicMeters,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.aeratedConcreteYtong,
        nameTr: "Ytong",
        amount: 1500,
        currency: Currency.lira,
        unit: Unit.cubicMeters,
        dateTime: DateTime(2023, 08),
    ),

    //Duvarcı - Şener ✓
    UnitPrice(
        category: UnitPriceCategory.aeratedConcreteLabor,
        nameTr: "Gazbeton İşçilik",
        amount: 80,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),

    //Çatıcı - Aydın (Fiyat zaten çalışıyor şu an)
    UnitPrice(
        category: UnitPriceCategory.steelConstructionBraasRoof,
        nameTr: "Çelik konstrüksiyon Braas Çatı",
        amount: 3000,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 01),
    ),

    //Yağmur İskele - Mesut ✓
    UnitPrice(
        category: UnitPriceCategory.steelScaffolding,
        nameTr: "Korkuluklu çelik iskele",
        amount: 208,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),

    //Doğrama - Rehau Seyid ✓
    UnitPrice(
        category: UnitPriceCategory.windowJoineryRehau,
        nameTr: "Rehau sürgülü, monoblok panjurlu",
        amount: 300,
        currency: Currency.euro,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 01),
    ),

    //Cepheci ✓
    UnitPrice(
        category: UnitPriceCategory.sinterFlexFacade,
        nameTr: "Sinterflex cephe",
        amount: 1500,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 01),
    ),
    UnitPrice(
        category: UnitPriceCategory.precastFacade,
        nameTr: "Prekast 3 cephe",
        amount: 120,
        currency: Currency.dollar,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),

    //Alçı Sıvacı - Abdullah ✓
    UnitPrice(
        category: UnitPriceCategory.plaster,
        nameTr: "Alçı sıva",
        amount: 175,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),

    //Boyacı - Nebi ✓
    UnitPrice(
        category: UnitPriceCategory.painting,
        nameTr: "Dyo",
        amount: 130,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),

    //Alçıpancı - Bedir ✓
    UnitPrice(
        category: UnitPriceCategory.drywall,
        nameTr: "Alçıpan",
        amount: 250,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.covingPlaster,
        nameTr: "Kartonpiyer",
        amount: 75,
        currency: Currency.lira,
        unit: Unit.meter,
        dateTime: DateTime(2023, 08),
    ),

    //Şapçı - (Şapçı Halitten fiyat al)
    UnitPrice(
        category: UnitPriceCategory.screed300Doses,
        nameTr: "300 Doz Şap",
        amount: 156,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 01),
    ),

    //Mermerci - Osman ✓
    UnitPrice(
        category: UnitPriceCategory.marbleFloorBilecik,
        nameTr: "Bilecik Beji Mermer",
        amount: 1200,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.marbleStepBilecik,
        nameTr: "Bilejik Beji Basamak",
        amount: 1000,
        currency: Currency.lira,
        unit: Unit.meter,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.marbleWindowsillBilecik,
        nameTr: "Bilejik Beji Denizlik",
        amount: 1000,
        currency: Currency.lira,
        unit: Unit.meter,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.quartzCountertopCimstone,
        nameTr: "Çimstone Mutfak Tezgahı",
        amount: 3800,
        currency: Currency.lira,
        unit: Unit.meter,
        dateTime: DateTime(2023, 08),
    ),

    //Banyo - Orhan, İnternet ✓
    UnitPrice(
        category: UnitPriceCategory.ceramicTileVitraVersus,
        nameTr: "Vitra Versus Seramik",
        amount: 500,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.sinkVitra,
        nameTr: "Vitra Lavabo",
        amount: 2000,
        currency: Currency.lira,
        unit: Unit.number,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.sinkBatteryVitra,
        nameTr: "Vitra Lavabo Bataryası",
        amount: 1500,
        currency: Currency.lira,
        unit: Unit.number,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.concealedCisternVitra,
        nameTr: "Vitra Gömme Rezervuar ve Taşı",
        amount: 3500,
        currency: Currency.lira,
        unit: Unit.number,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.showerBatteryVitra,
        nameTr: "Vitra Duş Bataryası",
        amount: 2000,
        currency: Currency.lira,
        unit: Unit.number,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.kitchenFaucetAndSinkFranke,
        nameTr: "Franke Evye ve Batarya",
        amount: 12500,
        currency: Currency.lira,
        unit: Unit.number,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.paddleBoxBuiltInOvenCookTopDishwasherFranke,
        nameTr: "Franke Ankastre Beyaz Eşya Seti",
        amount: 8000 + 10000 + 7000 + 15000,
        currency: Currency.lira,
        unit: Unit.apartment,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.automaticBarrier,
        nameTr: "Açık Otopark Otomatik Bariyer",
        amount: 35000,
        currency: Currency.lira,
        unit: Unit.number,
        dateTime: DateTime(2023, 08),
    ),

    //Sıcak Demirci - Selçuk, İnternet ✓
    UnitPrice(
        category: UnitPriceCategory.wroughtIronRailing,
        nameTr: "Ferforje Korkuluk",
        amount: 4500,
        currency: Currency.lira,
        unit: Unit.meter,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.aluminumRailing,
        nameTr: "Alüminyum Korkuluk",
        amount: 1000,
        currency: Currency.lira,
        unit: Unit.meter,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.trapezoidalSheetCurtain,
        nameTr: "Trapez sac çevre perdesi",
        amount: 1000,
        currency: Currency.lira,
        unit: Unit.meter,
        dateTime: DateTime(2023, 08),
    ),

    //Parke - şerifoğlu ✓
    UnitPrice(
        category: UnitPriceCategory.laminatedSerifoglu,
        nameTr: "Şerifoğlu Lamine Parke",
        amount: 52,
        currency: Currency.euro,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),

    //Kapıcı - Ahmet ✓
    UnitPrice(
        category: UnitPriceCategory.steelDoorKale,
        nameTr: "Kale Çelik Kapı",
        amount: 29400,
        currency: Currency.lira,
        unit: Unit.number,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.entranceDoor,
        nameTr: "Apartman Giriş Kapısı",
        amount: 14250,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.ironFireDoor,
        nameTr: "Yangın kapısı",
        amount: 4950,
        currency: Currency.lira,
        unit: Unit.number,
        dateTime: DateTime(2023, 08),
    ),

    //Oda kapısı - Artella (Şu an çalışıyor), StillDoor(Kapı fiyatı gelecek bu unit price'ı markalı yap)
    UnitPrice(
        category: UnitPriceCategory.lacqueredDoorArtella,
        nameTr: "Artella Lake Ahşap Kapı",
        amount: 8000,
        currency: Currency.lira,
        unit: Unit.number,
        dateTime: DateTime(2023, 01),
    ),

    //Mutfak dolabı - Hacker, Aster ✓
    UnitPrice(
        category: UnitPriceCategory.shinyLacqueredKitchenCupboardAster,
        nameTr: "Aster Parlak Lake",
        amount: 500,
        currency: Currency.euro,
        unit: Unit.meter,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.matteLacqueredKitchenCupboardAster,
        nameTr: "Aster Mat Lake",
        amount: 435,
        currency: Currency.euro,
        unit: Unit.meter,
        dateTime: DateTime(2023, 08),
    ),

    //Marangoz - Ramazan (Markasız olanlar bunun altında dursun)
    UnitPrice(
        category: UnitPriceCategory.lacqueredCabinet,
        nameTr: "Lake Dolap",
        amount: 5000,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 01),
    ),
    UnitPrice(
        category: UnitPriceCategory.lacqueredFloorPlinth,
        nameTr: "Lake Süpürgelik",
        amount: 100,
        currency: Currency.lira,
        unit: Unit.meter,
        dateTime: DateTime(2023, 01),
    ),

    //Mekanik Tesisatçı - Halil ✓
    UnitPrice(
        category: UnitPriceCategory.mechanicalInfrastructure,
        nameTr: "Mekanik Tesisat Altyapı İşleri",
        amount: 120000,
        currency: Currency.lira,
        unit: Unit.apartment,
        dateTime: DateTime(2023, 08),
    ),

    //Vrf - Klima ✓
    UnitPrice(
      category: UnitPriceCategory.airConditionerArcelik,
      nameTr: "Arçelik Klima",
      amount: 15000,
      currency: Currency.lira,
      unit: Unit.number,
      dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.vrfMultiSplitMitshubishiElectric,
        nameTr: "Mitshubishi Electric Multi Split",
        amount: 800,
        currency: Currency.euro,
        unit: Unit.number,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.ventilation,
        nameTr: "Havalandırma",
        amount: 10,
        currency: Currency.dollar,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),

    //Modüler su deposu ✓
    UnitPrice(
        category: UnitPriceCategory.galvanize25TonWaterTankEsinoks,
        nameTr: "Esinoks 25 Ton Galvaniz",
        amount: 5500,
        currency: Currency.dollar,
        unit: Unit.lumpSum,
        dateTime: DateTime(2023, 01),
    ),

    //Asansör - Kone ✓
    UnitPrice(
        category: UnitPriceCategory.elevation10PersonKone,
        nameTr: "Kone 10 Kişilik Asansör",
        fixedAmount: 30000,
        amount: 1000,
        currency: Currency.euro,
        unit: Unit.stop,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.elevation6PersonKone,
        nameTr: "Kone 6 Kişilik Asansör",
        fixedAmount: 20000,
        amount: 1000,
        currency: Currency.euro,
        unit: Unit.stop,
        dateTime: DateTime(2023, 08),
    ),

    //Araç lifti - Can ✓
    UnitPrice(
        category: UnitPriceCategory.carLift,
        nameTr: "Araç Asansörü",
        fixedAmount: 30000,
        amount: 5000,
        currency: Currency.euro,
        unit: Unit.stop,
        dateTime: DateTime(2023, 08),
    ),

    //Düşakabin ✓
    UnitPrice(
        category: UnitPriceCategory.showerHuppe100x100,
        nameTr: "Hüppe Duşakabin 160x80",
        amount: 18000,
        currency: Currency.lira,
        unit: Unit.number,
        dateTime: DateTime(2023, 08)
    ),

    //Elektrikçi - İhsan ✓
    UnitPrice(
        category: UnitPriceCategory.electricalInfrastructure,
        nameTr: "Elektrik Tesisat Altyapı İşleri",
        amount: 140000,
        currency: Currency.lira,
        unit: Unit.apartment,
        dateTime: DateTime(2023, 08)),

    //Jeneratör - Aksa (kontrol et Kenan'a sor)
    UnitPrice(
        category: UnitPriceCategory.generatorAksa160,
        nameTr: "Aksa 160 Kva Jeneratör",
        amount: 16282,
        currency: Currency.euro,
        unit: Unit.lumpSum,
        dateTime: DateTime(2023, 01)),

    //Kendin hesapla ✓
    UnitPrice(
        category: UnitPriceCategory.averageGarden,
        nameTr: "Bahçe, Çim, Ağaç vs.",
        amount: 3000,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.interlockingPavingStone,
        nameTr: "Kilit Taşı",
        amount: 400,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.mobilizationDemobilization,
        nameTr: "Mobilizasyon - Demobilizasyon",
        amount: 220000,
        currency: Currency.lira,
        unit: Unit.lumpSum,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.crane15Ton,
        nameTr: "15 Ton Vinç",
        amount: 6500,
        currency: Currency.lira,
        unit: Unit.hour,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.siteSafety,
        nameTr: "Şantiye güvenlik önlemleri",
        amount: 15000,
        currency: Currency.lira,
        unit: Unit.month,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.siteExpenses,
        nameTr: "Şantiye, Ofis, Elektrik, Su vb.",
        amount: 12000,
        currency: Currency.lira,
        unit: Unit.month,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.sergeantGrossWage,
        nameTr: "Şantiye Çavuşu Brüt Maaş",
        amount: 30000,
        currency: Currency.lira,
        unit: Unit.month,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.projectManagerGrossWage,
        nameTr: "Proje Müdürü Brüt Maaş",
        amount: 60000,
        currency: Currency.lira,
        unit: Unit.month,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.projectsFeesPayments,
        nameTr: "Projeler, resmi harçlar, ödemeler",
        amount: 1000000,
        currency: Currency.lira,
        unit: Unit.lumpSum,
        dateTime: DateTime(2023, 08)),
  ];

  List<UnitPrice> getAllUnitPrices() {
    return unitPrices;
  }
}
