import '../domain/model/unit_price/currency.dart';
import '../domain/model/unit_price/unit_price.dart';
import '../domain/model/unit_price/unit_price_category.dart';

class UnitPriceRepository {
  static List<UnitPrice> unitPrices = [
    //Zeminci - Deniz ✓
    UnitPrice(
        category: UnitPriceCategory.shutCrete,
        nameTr: "Shutcrete",
        amount: 2700,
        fixedAmount: 30000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)
    ),

    //Hafriyat - Habip ✓
    UnitPrice(
        category: UnitPriceCategory.excavation,
        nameTr: "Hafriyat",
        amount: 450,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.breaker,
        nameTr: "Kırıcı",
        amount: 2000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),

    //Kalıp Yaşar ✓
    UnitPrice(
        category: UnitPriceCategory.plywood,
        nameTr: "Plywood",
        amount: 800,
        currency: Currency.lira,
        dateTime: DateTime(2023, 07)),

    //Beton Albayrak ✓
    UnitPrice(
        category: UnitPriceCategory.c16Concrete,
        nameTr: "C16 Beton",
        amount: 2150,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.c30Concrete,
        nameTr: "C30 Beton",
        amount: 2250,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.c35Concrete,
        nameTr: "C35 Beton",
        amount: 2300,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.c40Concrete,
        nameTr: "C40 Beton",
        amount: 2400,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)
    ),

    //İnşaat Demiri - İnternet ✓
    UnitPrice(
        category: UnitPriceCategory.s420Steel,
        nameTr: "S420 Nervürlü İnşaat Demiri",
        amount: 19000/1.18,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)
    ),

    //Su İzolasyon - Tunç ✓
    UnitPrice(
        category: UnitPriceCategory.proofBitumenMembrane,
        nameTr: "Bitüm Esaslı Proof Membran",
        amount: 9,
        currency: Currency.dollar,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.bitumenSliding,
        nameTr: "Bitüm Esaslı Sürme İzolasyon",
        amount: 8,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.cementSliding,
        nameTr: "Çimento Esaslı Sürme İzolasyon",
        amount: 6.5,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.drainPlate,
        nameTr: "Drenaj Levhası",
        amount: 1.15,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08)),

    //Çeşitli Malzeme - Can
    UnitPrice(
        category: UnitPriceCategory.foundationStabilizationGravel,
        nameTr: "Mıcır",
        amount: 450,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.eps,
        nameTr: "Eps",
        amount: 815,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.aeratedConcreteMaterial,
        nameTr: "Gazbeton Malzeme",
        amount: 1500,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.cementBasedFlexInsulation,
        nameTr: "Çimento esaslı flex yalıtım malzemesi",
        amount: 200,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Duvarcı - Şener ✓
    UnitPrice(
        category: UnitPriceCategory.aeratedConcreteLabor,
        nameTr: "Gazbeton İşçilik",
        amount: 80,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),

    //Çatıcı - Aydın (Fiyat zaten çalışıyor şu an)
    UnitPrice(
        category: UnitPriceCategory.steelConstructionBraasRoof,
        nameTr: "Çelik konstrüksiyon Braas Çatı",
        amount: 3000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Yağmur İskele - Mesut ✓
    UnitPrice(
        category: UnitPriceCategory.steelScaffolding,
        nameTr: "Korkuluklu çelik iskele",
        amount: 208,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),

    //Doğrama - Rehau Seyid (Bunun euro teklifi vardı onun üzerinden gidebilirsin, kontrol et)
    UnitPrice(
        category: UnitPriceCategory.windowJoineryRehau,
        nameTr: "Rehau sürgülü, Hebeschiebe veya Volkswagen Doğrama",
        amount: 6000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Cepheci - (Bunun birim fiyatı nasıl hesaplanacak bir düşün)
    UnitPrice(
        category: UnitPriceCategory.ceramicFacade,
        nameTr: "Seramik cephe",
        amount: 600,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.precastFacade,
        nameTr: "Prekast cephe",
        amount: 800,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Alçı Sıvacı - Abdullah
    UnitPrice(
        category: UnitPriceCategory.plaster,
        nameTr: "Alçı sıva",
        amount: 100,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Boyacı - Nebi
    UnitPrice(
        category: UnitPriceCategory.painting,
        nameTr: "İç mekan boyası",
        amount: 110,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Alçıpancı - Bedir
    UnitPrice(
        category: UnitPriceCategory.drywall,
        nameTr: "Alçıpan",
        amount: 230,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.covingPlaster,
        nameTr: "Kartonpiyer",
        amount: 55,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Şapçı -
    UnitPrice(
        category: UnitPriceCategory.screed,
        nameTr: "Şap",
        amount: 156,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Mermerci - Osman
    UnitPrice(
        category: UnitPriceCategory.marbleFloorBilecik,
        nameTr: "Bilecik Beji Mermer",
        amount: 1000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.marbleStepBilecik,
        nameTr: "Bilejik Beji Basamak",
        amount: 850,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.marbleWindowsillBilecik,
        nameTr: "Bilejik Beji Denizlik",
        amount: 850,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.quartzCountertopCimstone,
        nameTr: "Çimstone Mutfak Tezgahı",
        amount: 3500,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Banyo - Orhan, İnternet ✓
    UnitPrice(
        category: UnitPriceCategory.ceramicTileVitraVersus,
        nameTr: "Vitra Versus Seramik",
        amount: 500,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.sinkVitra,
        nameTr: "Vitra Lavabo",
        amount: 2000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.sinkBatteryVitra,
        nameTr: "Vitra Lavabo Bataryası",
        amount: 1500,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.concealedCisternVitra,
        nameTr: "Vitra Gömme Rezervuar ve Tuvalet Taşı",
        amount: 3500,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.showerBatteryVitra,
        nameTr: "Vitra Duş Bataryası",
        amount: 2000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.kitchenFaucetAndSinkFranke,
        nameTr: "Franke Evye ve Batarya",
        amount: 12500,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.paddleBoxBuiltInOvenCookTopDishwasherFranke,
        nameTr: "Franke Ankastre Beyaz Eşya Seti",
        amount: 8000 + 10000 + 7000 + 15000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.automaticBarrier,
        nameTr: "Açık Otopark Otomatik Bariyer",
        amount: 35000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),

    //Sıcak Demirci - Selçuk, İnternet ✓
    UnitPrice(
        category: UnitPriceCategory.wroughtIronRailing,
        nameTr: "Ferforje Korkuluk",
        amount: 4500,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.aluminumRailing,
        nameTr: "Alüminyum Korkuluk",
        amount: 1000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.trapezoidalSheetCurtain,
        nameTr: "Trapez sac çevre perdesi",
        amount: 1000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 08)),

    //Parke - şerifoğlu ✓
    UnitPrice(
        category: UnitPriceCategory.laminatedSerifoglu,
        nameTr: "Şerifoğlu Lamine Parke",
        amount: 52,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08)),

    //Kapıcı - Ahmet
    UnitPrice(
        category: UnitPriceCategory.steelDoorKale,
        nameTr: "Kale Çelik Kapı",
        amount: 16000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.entranceDoor,
        nameTr: "Apartman Giriş Kapısı",
        amount: 9750,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.ironFireDoor,
        nameTr: "Yangına dayanıklı, panik barlı, demir kapı",
        amount: 4200,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Oda kapısı - StillDoor (Kapı fiyatı gelecek bu unit price'ı markalı yap)
    UnitPrice(
        category: UnitPriceCategory.lacqueredDoor,
        nameTr: "Lake Ahşap Kapı",
        amount: 8000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Mutfak dolabı - Ramazan, Hacker, Aster ✓
    UnitPrice(
        category: UnitPriceCategory.shinyLacqueredKitchenCupboardAster,
        nameTr: "Aster Marka Parlak Lake Mutfak Dolabı",
        amount: 500,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.matteLacqueredKitchenCupboardAster,
        nameTr: "Aster Marka Mat Lake Mutfak Dolabı",
        amount: 435,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08)),

    //Marangoz - Ramazan (Markasız olanlar bunun altında dursun)
    UnitPrice(
        category: UnitPriceCategory.lacqueredCabinet,
        nameTr: "Lake Dolap",
        amount: 5000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.lacqueredFloorPlinth,
        nameTr: "Lake Süpürgelik",
        amount: 100,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Mekanik Tesisatçı - Halil
    UnitPrice(
        category: UnitPriceCategory.mechanicalInfrastructure,
        nameTr: "Mekanik Tesisat Altyapı İşleri",
        amount: 100000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Vrf klima - Erdinç (Fiyat vermişti multi split felan onuda ekle Mitshubishi)
    UnitPrice(
        category: UnitPriceCategory.airConditionerArcelik,
        nameTr: "Arçelik Klima",
        amount: 10000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.ventilation,
        nameTr: "Havalandırma",
        amount: 180,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Modüler su deposu - Esinoks (Eski fiyatlardan gidebilirsin)
    UnitPrice(
        category: UnitPriceCategory.galvanize25TonWaterTankEsinoks,
        nameTr: "Esinoks 25 Ton Galvaniz Su Deposu",
        amount: 110000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Asansör - Kone ✓
    UnitPrice(
        category: UnitPriceCategory.elevation10PersonKone,
        nameTr: "Kone 10 Kişilik Asansör",
        fixedAmount: 30000,
        amount: 1000,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08)),
    UnitPrice(
        category: UnitPriceCategory.elevation6PersonKone,
        nameTr: "Kone 6 Kişilik Asansör",
        fixedAmount: 20000,
        amount: 1000,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08)),

    //Araç lifti - Can ✓
    UnitPrice(
        category: UnitPriceCategory.carLift,
        nameTr: "Araç Asansörü",
        fixedAmount: 30000,
        amount: 5000,
        currency: Currency.euro,
        dateTime: DateTime(2023, 08)),

    //Düşakabin - Hüppe (Eski fiyatlardan git)
    UnitPrice(
        category: UnitPriceCategory.showerHuppe,
        nameTr: "Hüppe Duşakabin",
        amount: 9000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Elektrikçi - İhsan
    UnitPrice(
        category: UnitPriceCategory.electricalInfrastructure,
        nameTr: "Elektrik Tesisat Altyapı İşleri",
        amount: 85000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),

    //Jeneratör - Aksa (Eski fiyatlardan git kontrol et)
    UnitPrice(
        category: UnitPriceCategory.generatorAksa160,
        nameTr: "Aksa 160 Kva Jeneratör",
        amount: 16282,
        currency: Currency.euro,
        dateTime: DateTime(2023, 01)),

    //Kendin hesapla
    UnitPrice(
        category: UnitPriceCategory.averageGarden,
        nameTr: "Bahçe, Çim, Ağaç vs.",
        amount: 2000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.interlockingPavingStone,
        nameTr: "Kilit Taşı",
        amount: 360,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.mobilizationDemobilization,
        nameTr: "Mobilizasyon - Demobilizasyon",
        amount: 200000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.crane15Ton,
        nameTr: "15 Ton Vinç",
        amount: 5000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.siteSafety,
        nameTr: "Şantiye güvenlik önlemleri",
        amount: 15000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 07)),
    UnitPrice(
        category: UnitPriceCategory.siteExpenses,
        nameTr: "Şantiye, Ofis, Elektrik, Su vb. Giderler",
        amount: 10000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.sergeantGrossWage,
        nameTr: "Şantiye Çavuşu Brüt Maaş",
        amount: 30000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.projectManagerGrossWage,
        nameTr: "Proje Müdürü Brüt Maaş",
        amount: 60000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
    UnitPrice(
        category: UnitPriceCategory.projectsFeesPayments,
        nameTr: "Projelerin çizilmesi, resmi harçlar, ödemeler",
        amount: 1000000,
        currency: Currency.lira,
        dateTime: DateTime(2023, 01)),
  ];

  List<UnitPrice> getAllUnitPrices() {
    return unitPrices;
  }
}
