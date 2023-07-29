import '../domain/model/unit_price/currency.dart';
import '../domain/model/unit_price/unit.dart';
import '../domain/model/unit_price/unit_price.dart';
import '../domain/model/unit_price/unit_price_category.dart';

class UnitPriceRepository {
  static List<UnitPrice> unitPrices = [
    //Zeminci - Deniz ✓
    UnitPrice(
        category: UnitPriceCategory.shutCrete,
        explanationTr: "Shutcrete",
        amount: 2700,
        fixedAmount: 30000,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),

    //Hafriyat - Habip ✓
    UnitPrice(
        category: UnitPriceCategory.excavation,
        explanationTr: "Hafriyat",
        amount: 450,
        currency: Currency.lira,
        unit: Unit.cubicMeters,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.breaker,
        explanationTr: "Kırıcı",
        amount: 2000,
        currency: Currency.lira,
        unit: Unit.hour,
        dateTime: DateTime(2023, 08)
    ),

    //Kalıp Yaşar ✓
    UnitPrice(
        category: UnitPriceCategory.plywood,
        explanationTr: "Plywood",
        amount: 800,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 07)
    ),

    //Beton Albayrak ✓
    UnitPrice(
        category: UnitPriceCategory.c16Concrete,
        explanationTr: "C16 Beton",
        amount: 2150,
        currency: Currency.lira,
        unit: Unit.cubicMeters,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.c30Concrete,
        explanationTr: "C30 Beton",
        amount: 2250,
        currency: Currency.lira,
        unit: Unit.cubicMeters,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.c35Concrete,
        explanationTr: "C35 Beton",
        amount: 2300,
        currency: Currency.lira,
        unit: Unit.cubicMeters,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.c40Concrete,
        explanationTr: "C40 Beton",
        amount: 2400,
        currency: Currency.lira,
        unit: Unit.cubicMeters,
        dateTime: DateTime(2023, 08),
    ),

    //İnşaat Demiri - İnternet ✓
    UnitPrice(
        category: UnitPriceCategory.s420Steel,
        explanationTr: "S420 Nervürlü İnşaat Demiri",
        amount: 19000/1.18,
        currency: Currency.lira,
        unit: Unit.ton,
        dateTime: DateTime(2023, 08),
    ),

    //Su İzolasyon - Tunç ✓
    UnitPrice(
        category: UnitPriceCategory.proofBitumenMembrane,
        explanationTr: "Bitüm Esaslı Proof Membran",
        amount: 9,
        currency: Currency.dollar,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.bitumenSliding,
        explanationTr: "Bitüm Esaslı Sürme İzolasyon",
        amount: 8,
        currency: Currency.euro,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.cementSliding,
        explanationTr: "Çimento Esaslı Sürme İzolasyon",
        amount: 6.5,
        currency: Currency.euro,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.drainPlate,
        explanationTr: "Drenaj Levhası",
        amount: 1.15,
        currency: Currency.euro,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),

    //Çeşitli Malzeme - Can
    UnitPrice(
        category: UnitPriceCategory.foundationStabilizationGravel,
        explanationTr: "Mıcır",
        amount: 450,
        currency: Currency.lira,
        unit: Unit.cubicMeters,
        dateTime: DateTime(2023, 01),
    ),
    UnitPrice(
        category: UnitPriceCategory.eps,
        explanationTr: "Eps",
        amount: 815,
        currency: Currency.lira,
        unit: Unit.cubicMeters,
        dateTime: DateTime(2023, 01),
    ),
    UnitPrice(
        category: UnitPriceCategory.aeratedConcreteMaterial,
        explanationTr: "Gazbeton Malzeme",
        amount: 1500,
        currency: Currency.lira,
        unit: Unit.cubicMeters,
        dateTime: DateTime(2023, 01),
    ),
    UnitPrice(
        category: UnitPriceCategory.cementBasedFlexInsulation,
        explanationTr: "Çimento esaslı flex yalıtım malzemesi",
        amount: 200,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 01),
    ),

    //Duvarcı - Şener ✓
    UnitPrice(
        category: UnitPriceCategory.aeratedConcreteLabor,
        explanationTr: "Gazbeton İşçilik",
        amount: 80,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),

    //Çatıcı - Aydın (Fiyat zaten çalışıyor şu an)
    UnitPrice(
        category: UnitPriceCategory.steelConstructionBraasRoof,
        explanationTr: "Çelik konstrüksiyon Braas Çatı",
        amount: 3000,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 01),
    ),

    //Yağmur İskele - Mesut ✓
    UnitPrice(
        category: UnitPriceCategory.steelScaffolding,
        explanationTr: "Korkuluklu çelik iskele",
        amount: 208,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),

    //Doğrama - Rehau Seyid (Bunun euro teklifi vardı onun üzerinden gidebilirsin, kontrol et)
    UnitPrice(
        category: UnitPriceCategory.windowJoineryRehau,
        explanationTr: "Rehau sürgülü, Hebeschiebe veya Volkswagen Doğrama",
        amount: 6000,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 01),
    ),

    //Cepheci - (Bunun birim fiyatı nasıl hesaplanacak bir düşün)
    UnitPrice(
        category: UnitPriceCategory.ceramicFacade,
        explanationTr: "Seramik cephe",
        amount: 600,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 01),
    ),
    UnitPrice(
        category: UnitPriceCategory.precastFacade,
        explanationTr: "Prekast cephe",
        amount: 800,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 01),
    ),

    //Alçı Sıvacı - Abdullah
    UnitPrice(
        category: UnitPriceCategory.plaster,
        explanationTr: "Alçı sıva",
        amount: 100,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 01),
    ),

    //Boyacı - Nebi
    UnitPrice(
        category: UnitPriceCategory.painting,
        explanationTr: "İç mekan boyası",
        amount: 110,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 01),
    ),

    //Alçıpancı - Bedir
    UnitPrice(
        category: UnitPriceCategory.drywall,
        explanationTr: "Alçıpan",
        amount: 230,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 01),
    ),
    UnitPrice(
        category: UnitPriceCategory.covingPlaster,
        explanationTr: "Kartonpiyer",
        amount: 55,
        currency: Currency.lira,
        unit: Unit.meter,
        dateTime: DateTime(2023, 01),
    ),

    //Şapçı -
    UnitPrice(
        category: UnitPriceCategory.screed,
        explanationTr: "Şap",
        amount: 156,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 01),
    ),

    //Mermerci - Osman
    UnitPrice(
        category: UnitPriceCategory.marbleFloorBilecik,
        explanationTr: "Bilecik Beji Mermer",
        amount: 1000,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 01),
    ),
    UnitPrice(
        category: UnitPriceCategory.marbleStepBilecik,
        explanationTr: "Bilejik Beji Basamak",
        amount: 850,
        currency: Currency.lira,
        unit: Unit.meter,
        dateTime: DateTime(2023, 01),
    ),
    UnitPrice(
        category: UnitPriceCategory.marbleWindowsillBilecik,
        explanationTr: "Bilejik Beji Denizlik",
        amount: 850,
        currency: Currency.lira,
        unit: Unit.meter,
        dateTime: DateTime(2023, 01),
    ),
    UnitPrice(
        category: UnitPriceCategory.quartzCountertopCimstone,
        explanationTr: "Çimstone Mutfak Tezgahı",
        amount: 3500,
        currency: Currency.lira,
        unit: Unit.meter,
        dateTime: DateTime(2023, 01),
    ),

    //Banyo - Orhan, İnternet ✓
    UnitPrice(
        category: UnitPriceCategory.ceramicTileVitraVersus,
        explanationTr: "Vitra Versus Seramik",
        amount: 500,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.sinkVitra,
        explanationTr: "Vitra Lavabo",
        amount: 2000,
        currency: Currency.lira,
        unit: Unit.number,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.sinkBatteryVitra,
        explanationTr: "Vitra Lavabo Bataryası",
        amount: 1500,
        currency: Currency.lira,
        unit: Unit.number,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.concealedCisternVitra,
        explanationTr: "Vitra Gömme Rezervuar ve Tuvalet Taşı",
        amount: 3500,
        currency: Currency.lira,
        unit: Unit.number,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.showerBatteryVitra,
        explanationTr: "Vitra Duş Bataryası",
        amount: 2000,
        currency: Currency.lira,
        unit: Unit.number,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.kitchenFaucetAndSinkFranke,
        explanationTr: "Franke Evye ve Batarya",
        amount: 12500,
        currency: Currency.lira,
        unit: Unit.number,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.paddleBoxBuiltInOvenCookTopDishwasherFranke,
        explanationTr: "Franke Ankastre Beyaz Eşya Seti",
        amount: 8000 + 10000 + 7000 + 15000,
        currency: Currency.lira,
        unit: Unit.apartment,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.automaticBarrier,
        explanationTr: "Açık Otopark Otomatik Bariyer",
        amount: 35000,
        currency: Currency.lira,
        unit: Unit.number,
        dateTime: DateTime(2023, 08),
    ),

    //Sıcak Demirci - Selçuk, İnternet ✓
    UnitPrice(
        category: UnitPriceCategory.wroughtIronRailing,
        explanationTr: "Ferforje Korkuluk",
        amount: 4500,
        currency: Currency.lira,
        unit: Unit.meter,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.aluminumRailing,
        explanationTr: "Alüminyum Korkuluk",
        amount: 1000,
        currency: Currency.lira,
        unit: Unit.meter,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.trapezoidalSheetCurtain,
        explanationTr: "Trapez sac çevre perdesi",
        amount: 1000,
        currency: Currency.lira,
        unit: Unit.meter,
        dateTime: DateTime(2023, 08),
    ),

    //Parke - şerifoğlu ✓
    UnitPrice(
        category: UnitPriceCategory.laminatedSerifoglu,
        explanationTr: "Şerifoğlu Lamine Parke",
        amount: 52,
        currency: Currency.euro,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 08),
    ),

    //Kapıcı - Ahmet
    UnitPrice(
        category: UnitPriceCategory.steelDoorKale,
        explanationTr: "Kale Çelik Kapı",
        amount: 16000,
        currency: Currency.lira,
        unit: Unit.number,
        dateTime: DateTime(2023, 01),
    ),
    UnitPrice(
        category: UnitPriceCategory.entranceDoor,
        explanationTr: "Apartman Giriş Kapısı",
        amount: 9750,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 01),
    ),
    UnitPrice(
        category: UnitPriceCategory.ironFireDoor,
        explanationTr: "Yangına dayanıklı, panik barlı, demir kapı",
        amount: 4200,
        currency: Currency.lira,
        unit: Unit.number,
        dateTime: DateTime(2023, 01),
    ),

    //Oda kapısı - StillDoor (Kapı fiyatı gelecek bu unit price'ı markalı yap)
    UnitPrice(
        category: UnitPriceCategory.lacqueredDoor,
        explanationTr: "Lake Ahşap Kapı",
        amount: 8000,
        currency: Currency.lira,
        unit: Unit.number,
        dateTime: DateTime(2023, 01),
    ),

    //Mutfak dolabı - Ramazan, Hacker, Aster ✓
    UnitPrice(
        category: UnitPriceCategory.shinyLacqueredKitchenCupboardAster,
        explanationTr: "Aster Marka Parlak Lake Mutfak Dolabı",
        amount: 500,
        currency: Currency.euro,
        unit: Unit.meter,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.matteLacqueredKitchenCupboardAster,
        explanationTr: "Aster Marka Mat Lake Mutfak Dolabı",
        amount: 435,
        currency: Currency.euro,
        unit: Unit.meter,
        dateTime: DateTime(2023, 08),
    ),

    //Marangoz - Ramazan (Markasız olanlar bunun altında dursun)
    UnitPrice(
        category: UnitPriceCategory.lacqueredCabinet,
        explanationTr: "Lake Dolap",
        amount: 5000,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 01),
    ),
    UnitPrice(
        category: UnitPriceCategory.lacqueredFloorPlinth,
        explanationTr: "Lake Süpürgelik",
        amount: 100,
        currency: Currency.lira,
        unit: Unit.meter,
        dateTime: DateTime(2023, 01),
    ),

    //Mekanik Tesisatçı - Halil
    UnitPrice(
        category: UnitPriceCategory.mechanicalInfrastructure,
        explanationTr: "Mekanik Tesisat Altyapı İşleri",
        amount: 100000,
        currency: Currency.lira,
        unit: Unit.apartment,
        dateTime: DateTime(2023, 01),
    ),

    //Vrf klima - Erdinç (Fiyat vermişti multi split felan onuda ekle Mitshubishi)
    UnitPrice(
        category: UnitPriceCategory.airConditionerArcelik,
        explanationTr: "Arçelik Klima",
        amount: 10000,
        currency: Currency.lira,
        unit: Unit.number,
        dateTime: DateTime(2023, 01),
    ),
    UnitPrice(
        category: UnitPriceCategory.ventilation,
        explanationTr: "Havalandırma",
        amount: 180,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 01),
    ),

    //Modüler su deposu - Esinoks (Eski fiyatlardan gidebilirsin)
    UnitPrice(
        category: UnitPriceCategory.galvanize25TonWaterTankEsinoks,
        explanationTr: "Esinoks 25 Ton Galvaniz Su Deposu",
        amount: 110000,
        currency: Currency.lira,
        unit: Unit.lumpSum,
        dateTime: DateTime(2023, 01),
    ),

    //Asansör - Kone ✓
    UnitPrice(
        category: UnitPriceCategory.elevation10PersonKone,
        explanationTr: "Kone 10 Kişilik Asansör",
        fixedAmount: 30000,
        amount: 1000,
        currency: Currency.euro,
        unit: Unit.stop,
        dateTime: DateTime(2023, 08),
    ),
    UnitPrice(
        category: UnitPriceCategory.elevation6PersonKone,
        explanationTr: "Kone 6 Kişilik Asansör",
        fixedAmount: 20000,
        amount: 1000,
        currency: Currency.euro,
        unit: Unit.stop,
        dateTime: DateTime(2023, 08),
    ),

    //Araç lifti - Can ✓
    UnitPrice(
        category: UnitPriceCategory.carLift,
        explanationTr: "Araç Asansörü",
        fixedAmount: 30000,
        amount: 5000,
        currency: Currency.euro,
        unit: Unit.stop,
        dateTime: DateTime(2023, 08),
    ),

    //Düşakabin - Hüppe (Eski fiyatlardan git)
    UnitPrice(
        category: UnitPriceCategory.showerHuppe,
        explanationTr: "Hüppe Duşakabin",
        amount: 9000,
        currency: Currency.lira,
        unit: Unit.number,
        dateTime: DateTime(2023, 01)
    ),

    //Elektrikçi - İhsan
    UnitPrice(
        category: UnitPriceCategory.electricalInfrastructure,
        explanationTr: "Elektrik Tesisat Altyapı İşleri",
        amount: 85000,
        currency: Currency.lira,
        unit: Unit.apartment,
        dateTime: DateTime(2023, 01)),

    //Jeneratör - Aksa (Eski fiyatlardan git kontrol et)
    UnitPrice(
        category: UnitPriceCategory.generatorAksa160,
        explanationTr: "Aksa 160 Kva Jeneratör",
        amount: 16282,
        currency: Currency.euro,
        unit: Unit.lumpSum,
        dateTime: DateTime(2023, 01)),

    //Kendin hesapla
    UnitPrice(
        category: UnitPriceCategory.averageGarden,
        explanationTr: "Bahçe, Çim, Ağaç vs.",
        amount: 2000,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.interlockingPavingStone,
        explanationTr: "Kilit Taşı",
        amount: 360,
        currency: Currency.lira,
        unit: Unit.squareMeters,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.mobilizationDemobilization,
        explanationTr: "Mobilizasyon - Demobilizasyon",
        amount: 200000,
        currency: Currency.lira,
        unit: Unit.lumpSum,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.crane15Ton,
        explanationTr: "15 Ton Vinç",
        amount: 5000,
        currency: Currency.lira,
        unit: Unit.hour,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.siteSafety,
        explanationTr: "Şantiye güvenlik önlemleri",
        amount: 15000,
        currency: Currency.lira,
        unit: Unit.month,
        dateTime: DateTime(2023, 07)),
    UnitPrice(
        category: UnitPriceCategory.siteExpenses,
        explanationTr: "Şantiye, Ofis, Elektrik, Su vb. Giderler",
        amount: 10000,
        currency: Currency.lira,
        unit: Unit.month,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.sergeantGrossWage,
        explanationTr: "Şantiye Çavuşu Brüt Maaş",
        amount: 30000,
        currency: Currency.lira,
        unit: Unit.month,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.projectManagerGrossWage,
        explanationTr: "Proje Müdürü Brüt Maaş",
        amount: 60000,
        currency: Currency.lira,
        unit: Unit.month,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.projectsFeesPayments,
        explanationTr: "Projelerin çizilmesi, resmi harçlar, ödemeler",
        amount: 1000000,
        currency: Currency.lira,
        unit: Unit.lumpSum,
        dateTime: DateTime(2023, 01)),
  ];

  List<UnitPrice> getAllUnitPrices() {
    return unitPrices;
  }
}
