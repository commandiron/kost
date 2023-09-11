enum UnitPriceCategory {
  shutCrete(Unit.squareMeters,),
  excavation(Unit.cubicMeters,),
  breaker(Unit.hour,),
  foundationStabilizationGravel(Unit.ton,),
  c16Concrete(Unit.cubicMeters,),
  reinforcedConcreteWorkmanshipWithPlywood(Unit.squareMeters,),
  c30Concrete(Unit.cubicMeters,),
  c35Concrete(Unit.cubicMeters,),
  c40Concrete(Unit.cubicMeters,),
  s420Steel(Unit.ton,),
  eps14Dns(Unit.cubicMeters,),
  proofBitumenMembrane(Unit.squareMeters,),
  bitumenSliding(Unit.squareMeters,),
  cementSliding(Unit.squareMeters,),
  drainPlate(Unit.squareMeters,),
  aeratedConcreteYtong(Unit.cubicMeters,),
  aeratedConcreteLabor(Unit.squareMeters,),
  steelConstructionBraasRoof(Unit.squareMeters,),
  steelScaffolding(Unit.squareMeters,),
  windowJoineryRehau(Unit.squareMeters,),
  wroughtIronRailing(Unit.meter,),
  aluminumRailing(Unit.meter,),
  sinterFlex4Facade(Unit.squareMeters,),
  precast3FacadePlaster1Facade(Unit.squareMeters,),
  plaster(Unit.squareMeters,),
  painting(Unit.squareMeters,),
  cementBasedFlexInsulation(Unit.squareMeters,),
  drywall(Unit.squareMeters,),
  covingPlaster(Unit.meter,),
  screed300Doses(Unit.squareMeters,),
  marbleFloorBilecik(Unit.squareMeters,),
  marbleStepBilecik(Unit.meter,),
  marbleWindowsillBilecik(Unit.meter,),
  ceramicTileVitraVersus(Unit.squareMeters,),
  laminatedSerifoglu(Unit.squareMeters,),
  steelDoorKale(Unit.number,),
  entranceDoor(Unit.squareMeters,),
  ironFireDoor(Unit.number,),
  lacqueredDoorArtella(Unit.number,),
  shinyLacqueredKitchenCupboardAster(Unit.meter,),
  matteLacqueredKitchenCupboardAster(Unit.meter,),
  quartzCountertopCimstone(Unit.meter,),
  lacqueredCabinet(Unit.squareMeters,),
  lacqueredFloorPlinth(Unit.meter,),
  mechanicalInfrastructure(Unit.apartment,),
  airConditionerArcelik(Unit.number,),
  vrfMultiSplitMitsubishiElectric(Unit.number,),
  ventilation(Unit.squareMeters,),
  galvanize25TonWaterTankEsinoks(Unit.number,),
  elevation10PersonKone(Unit.stop,),
  elevation6PersonKone(Unit.stop,),
  sinkVitra(Unit.number,),
  sinkBatteryVitra(Unit.number,),
  concealedCisternVitra(Unit.number,),
  showerHuppe100x100(Unit.number,),
  showerBatteryVitra(Unit.number,),
  kitchenFaucetAndSinkFranke(Unit.number,),
  electricalInfrastructure(Unit.apartment,),
  generatorAksa160(Unit.number,),
  paddleBoxBuiltInOvenCookTopDishwasherFranke(Unit.apartment,),
  averageGarden(Unit.squareMeters,),
  interlockingPavingStone(Unit.squareMeters,),
  carLift(Unit.stop,),
  automaticBarrier(Unit.number,),
  automaticShutter(Unit.number,),
  trapezoidalSheetCurtain(Unit.meter,),
  mobilizationDemobilization(Unit.lumpSum,),
  crane55Ton(Unit.hour,),
  siteSafety(Unit.month,),
  siteExpenses(Unit.month,),
  sergeantGrossWage(Unit.month,),
  siteChiefGrossWage(Unit.month,),
  projectsFeesPayments(Unit.lumpSum,);

  const UnitPriceCategory(this.unit);
  final Unit unit;
}

extension UnitPriceCategoryExtension on UnitPriceCategory {
  String get nameTr {
    return switch (this) {
    UnitPriceCategory.shutCrete => "Shutcrete",
    UnitPriceCategory.excavation => "Hafriyat",
    UnitPriceCategory.breaker => "Kırıcı",
    UnitPriceCategory.foundationStabilizationGravel => "Mıcır",
    UnitPriceCategory.c16Concrete => "C16 Beton",
    UnitPriceCategory.reinforcedConcreteWorkmanshipWithPlywood => "Plywood",
    UnitPriceCategory.c30Concrete => "C30 Beton",
    UnitPriceCategory.c35Concrete => "C35 Beton",
    UnitPriceCategory.c40Concrete => "C40 Beton",
    UnitPriceCategory.s420Steel => "S420 İnşaat Demiri",
    UnitPriceCategory.eps14Dns => "14 Dansite Eps",
    UnitPriceCategory.proofBitumenMembrane => "Bitüm Esaslı Proof Membran",
    UnitPriceCategory.bitumenSliding => "Bitüm Esaslı Sürme İzolasyon",
    UnitPriceCategory.cementSliding => "Çimento Esaslı Kristalize Sürme İzolasyon",
    UnitPriceCategory.drainPlate => "Drenaj Levhası",
    UnitPriceCategory.aeratedConcreteYtong => "Ytong",
    UnitPriceCategory.aeratedConcreteLabor => "Gazbeton İşçilik",
    UnitPriceCategory.steelConstructionBraasRoof => "Çelik konstrüksiyon Braas Çatı",
    UnitPriceCategory.steelScaffolding => "Korkuluklu çelik iskele",
    UnitPriceCategory.windowJoineryRehau => "Rehau sürgülü, monoblok panjurlu",
    UnitPriceCategory.wroughtIronRailing => "Ferforje Korkuluk",
    UnitPriceCategory.aluminumRailing => "Alüminyum Korkuluk",
    UnitPriceCategory.sinterFlex4Facade => "4 cephe Sinterflex",
    UnitPriceCategory.precast3FacadePlaster1Facade => "3 cephe Prekast - 1 cephe Sıva, Boya",
    UnitPriceCategory.plaster => "Alçı sıva",
    UnitPriceCategory.painting => "Dyo boya",
    UnitPriceCategory.cementBasedFlexInsulation => "Çimento Esaslı Tam Elastik Sürme İzolasyon",
    UnitPriceCategory.drywall => "Alçıpan",
    UnitPriceCategory.covingPlaster => "Kartonpiyer",
    UnitPriceCategory.screed300Doses => "300 Doz Şap",
    UnitPriceCategory.marbleFloorBilecik => "Bilecik Beji Mermer",
    UnitPriceCategory.marbleStepBilecik => "Bilejik Beji Basamak",
    UnitPriceCategory.marbleWindowsillBilecik => "Bilejik Beji Denizlik",
    UnitPriceCategory.ceramicTileVitraVersus => "Vitra Versus Seramik",
    UnitPriceCategory.laminatedSerifoglu => "Şerifoğlu Lamine Parke",
    UnitPriceCategory.steelDoorKale => "Kale Çelik Kapı",
    UnitPriceCategory.entranceDoor => "Apartman Giriş Kapısı",
    UnitPriceCategory.ironFireDoor => "Yangın kapısı",
    UnitPriceCategory.lacqueredDoorArtella => "Artella Lake Ahşap Kapı",
    UnitPriceCategory.shinyLacqueredKitchenCupboardAster =>  "Aster Parlak Lake",
    UnitPriceCategory.matteLacqueredKitchenCupboardAster => "Aster Mat Lake",
    UnitPriceCategory.quartzCountertopCimstone => "Çimstone Mutfak Tezgahı",
    UnitPriceCategory.lacqueredCabinet => "Lake Dolap",
    UnitPriceCategory.lacqueredFloorPlinth =>  "Lake Süpürgelik",
    UnitPriceCategory.mechanicalInfrastructure => "Mekanik Tesisat Altyapı İşleri",
    UnitPriceCategory.airConditionerArcelik => "Arçelik Klima",
    UnitPriceCategory.vrfMultiSplitMitsubishiElectric =>  "Mitshubishi Electric Multi Split",
    UnitPriceCategory.ventilation => "Havalandırma",
    UnitPriceCategory.galvanize25TonWaterTankEsinoks => "Esinoks 25 Ton Galvaniz",
    UnitPriceCategory.elevation10PersonKone => "Kone 10 Kişilik Asansör",
    UnitPriceCategory.elevation6PersonKone => "Kone 6 Kişilik Asansör",
    UnitPriceCategory.sinkVitra => "Vitra Lavabo",
    UnitPriceCategory.sinkBatteryVitra => "Vitra Lavabo Bataryası",
    UnitPriceCategory.concealedCisternVitra => "Vitra Gömme Rezervuar ve Taşı",
    UnitPriceCategory.showerHuppe100x100 => "Hüppe Duşakabin 100x100",
    UnitPriceCategory.showerBatteryVitra => "Vitra Duş Bataryası",
    UnitPriceCategory.kitchenFaucetAndSinkFranke => "Franke Evye ve Batarya",
    UnitPriceCategory.electricalInfrastructure => "Elektrik Tesisat Altyapı İşleri",
    UnitPriceCategory.generatorAksa160 => "Aksa 160 Kva Jeneratör",
    UnitPriceCategory.paddleBoxBuiltInOvenCookTopDishwasherFranke => "Franke Ankastre Beyaz Eşya (Davlumbaz, Fırın, Set Üstü Ocak, Bulaşık Makinesi)",
    UnitPriceCategory.averageGarden => "Bahçe, Çim, Ağaç vs.",
    UnitPriceCategory.interlockingPavingStone => "Kilit Taşı",
    UnitPriceCategory.carLift => "Araç Asansörü",
    UnitPriceCategory.automaticBarrier => "Açık Otopark Otomatik Bariyer",
    UnitPriceCategory.automaticShutter => "Otomatik Kepenk",
    UnitPriceCategory.trapezoidalSheetCurtain => "Trapez sac çevre perdesi",
    UnitPriceCategory.mobilizationDemobilization => "Mobilizasyon - Demobilizasyon",
    UnitPriceCategory.crane55Ton => "55 Ton Vinç",
    UnitPriceCategory.siteSafety => "Şantiye güvenlik önlemleri",
    UnitPriceCategory.siteExpenses => "Şantiye, Ofis, Elektrik, Su vb.",
    UnitPriceCategory.sergeantGrossWage => "Şantiye Çavuşu Brüt Maaş",
    UnitPriceCategory.siteChiefGrossWage => "Şantiye Şefi Brüt Maaş",
    UnitPriceCategory.projectsFeesPayments => "Projeler, resmi harçlar, ödemeler",
    };
  }
}

enum Unit {
  meter, squareMeters, cubicMeters, ton, number, hour, apartment, stop, month, lumpSum,
}
extension UnitExtension on Unit {
  String get symbol {
    switch(this) {
      case Unit.meter : return "m";
      case Unit.squareMeters : return "m²";
      case Unit.cubicMeters : return "m³";
      case Unit.ton : return "ton";
      case Unit.number : return "adet";
      case Unit.hour : return "saat";
      case Unit.apartment : return "daire";
      case Unit.stop : return "durak";
      case Unit.lumpSum : return "gtr";
      case Unit.month : return "ay";
    }
  }
}