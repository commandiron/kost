import 'package:kost/domain/model/unit_price/unit.dart';

enum UnitPriceCategory {
  shutCrete(Unit.squareMeters,),
  excavation(Unit.cubicMeters,),
  breaker(Unit.hour),
  foundationStabilizationGravel(Unit.cubicMeters),
  c16Concrete(Unit.cubicMeters),
  plywood(Unit.squareMeters),
  c30Concrete(Unit.cubicMeters),
  c35Concrete(Unit.cubicMeters),
  s420Steel( Unit.ton),
  eps(Unit.cubicMeters),
  doubleLayerBitumenMembrane(Unit.squareMeters),
  bitumenSliding(Unit.squareMeters),
  drainPlate(Unit.squareMeters),
  aeratedConcreteMaterial(Unit.cubicMeters),
  aeratedConcreteLabor(Unit.squareMeters),
  steelConstructionBraasRoof(Unit.squareMeters),
  steelScaffolding(Unit.squareMeters),
  windowJoineryRehau(Unit.squareMeters),
  wroughtIronRailing(Unit.meter),
  aluminumRailing(Unit.meter),
  ceramicFacade(Unit.squareMeters),
  precastFacade(Unit.squareMeters),
  plaster(Unit.squareMeters),
  painting(Unit.squareMeters),
  cementBasedFlexInsulation(Unit.squareMeters),
  drywall(Unit.squareMeters),
  covingPlaster(Unit.meter),
  screed(Unit.squareMeters),
  marbleFloorBilecik(Unit.squareMeters),
  marbleStepBilecik(Unit.meter),
  marbleWindowsillBilecik(Unit.meter),
  ceramicTileEge(Unit.squareMeters),
  laminatedSerifoglu(Unit.squareMeters),
  steelDoorKale(Unit.number),
  entranceDoor(Unit.squareMeters),
  ironFireDoor(Unit.number),
  lacqueredDoor(Unit.number),
  lacqueredKitchenCupboard(Unit.meter),
  quartzCountertopCimstone(Unit.meter),
  lacqueredCabinet(Unit.squareMeters),
  lacqueredFloorPlinth(Unit.meter),
  mechanicalInfrastructure(Unit.apartment),
  airConditionerArcelik(Unit.number),
  ventilation(Unit.squareMeters),
  galvanize25TonWaterTankEsinoks(Unit.number),
  elevation10PersonKone(Unit.stop),
  elevation6PersonKone(Unit.stop),
  sinkVitra(Unit.number),
  sinkBatteryVitra(Unit.number),
  concealedCisternVitra(Unit.number),
  showerHuppe(Unit.number),
  showerBatteryVitra(Unit.number),
  kitchenFaucetAndSinkFranke(Unit.number),
  electricalInfrastructure(Unit.apartment),
  generatorAksa160(Unit.number),
  fullSetFranke(Unit.apartment),
  averageGarden(Unit.squareMeters),
  interlockingPavingStone(Unit.squareMeters),
  carLift(Unit.stop),
  automaticBarrier(Unit.number),
  trapezoidalSheetCurtain(Unit.meter),
  mobilizationDemobilization(Unit.lumpSum),
  crane10Ton(Unit.hour),
  siteSafety(Unit.month),
  siteExpenses(Unit.month),
  sergeantGrossWage(Unit.month),
  projectManagerGrossWage(Unit.month),
  projectsFeesPayments(Unit.lumpSum);

  const UnitPriceCategory(
    this.unit,
  );
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
      UnitPriceCategory.plywood => "Plywood",
      UnitPriceCategory.c30Concrete => "C30 Beton",
      UnitPriceCategory.c35Concrete => "C35 Beton",
      UnitPriceCategory.s420Steel => "S420 Nervürlü İnşaat Demiri",
      UnitPriceCategory.eps => "Eps",
      UnitPriceCategory.doubleLayerBitumenMembrane => "Bitüm Esaslı Membran (Çift Kat)",
      UnitPriceCategory.bitumenSliding => "Bitüm Esaslı Sürme İzolasyon",
      UnitPriceCategory.drainPlate => "Drenaj Levhası",
      UnitPriceCategory.aeratedConcreteMaterial => "Gazbeton Malzeme",
      UnitPriceCategory.aeratedConcreteLabor => "Gazbeton İşçilik",
      UnitPriceCategory.steelConstructionBraasRoof => "Çelik konstrüksiyon Braas Çatı",
      UnitPriceCategory.steelScaffolding => "Korkuluklu çelik iskele",
      UnitPriceCategory.windowJoineryRehau => "Rehau sürgülü, Hebeschiebe veya Volkswagen Doğrama",
      UnitPriceCategory.wroughtIronRailing => "Ferforje Korkuluk",
      UnitPriceCategory.aluminumRailing => "Alüminyum Korkuluk",
      UnitPriceCategory.ceramicFacade => "Seramik cephe",
      UnitPriceCategory.precastFacade => "Prekast cephe",
      UnitPriceCategory.plaster => "Alçı sıva",
      UnitPriceCategory.painting => "İç mekan boyası",
      UnitPriceCategory.cementBasedFlexInsulation => "Çimento esaslı flex yalıtım malzemesi",
      UnitPriceCategory.drywall => "Alçıpan",
      UnitPriceCategory.covingPlaster => "Kartonpiyer",
      UnitPriceCategory.screed => "Şap",
      UnitPriceCategory.marbleFloorBilecik => "Bilecik Beji",
      UnitPriceCategory.marbleStepBilecik => "Bilecik Beji Basamak",
      UnitPriceCategory.marbleWindowsillBilecik => "Bilecik Beji Denizlik",
      UnitPriceCategory.ceramicTileEge => "Ege Seramik",
      UnitPriceCategory.laminatedSerifoglu => "Şerifoğlu marka lamine parke",
      UnitPriceCategory.steelDoorKale => "Kale Çelik Kapı",
      UnitPriceCategory.entranceDoor => "Apartman Giriş Kapısı",
      UnitPriceCategory.ironFireDoor => "Yangına dayanıklı, panik barlı, demir kapı",
      UnitPriceCategory.lacqueredDoor => "Lake Ahşap Kapı",
      UnitPriceCategory.lacqueredKitchenCupboard => "Lake Mutfak Dolabı",
      UnitPriceCategory.quartzCountertopCimstone => "Çimstone Mutfak Tezgahı",
      UnitPriceCategory.lacqueredCabinet => "Lake Dolap",
      UnitPriceCategory.lacqueredFloorPlinth => "Lake Süpürgelik",
      UnitPriceCategory.mechanicalInfrastructure => "Mekanik Tesisat Altyapı İşleri",
      UnitPriceCategory.airConditionerArcelik => "Arçelik Klima",
      UnitPriceCategory.ventilation => "Havalandırma",
      UnitPriceCategory.galvanize25TonWaterTankEsinoks => "Esinoks 25 Ton Galvaniz Su Deposu",
      UnitPriceCategory.elevation10PersonKone => "Kone 10 Kişilik Asansör",
      UnitPriceCategory.elevation6PersonKone => "Kone 6 Kişilik Asansör",
      UnitPriceCategory.sinkVitra => "Vitra Lavabo",
      UnitPriceCategory.sinkBatteryVitra => "Vitra Lavabo Bataryası",
      UnitPriceCategory.concealedCisternVitra => "Vitra Gömme Rezervuar ve Tuvalet Taşı",
      UnitPriceCategory.showerHuppe => "Hüppe Duşakabin",
      UnitPriceCategory.showerBatteryVitra => "Vitra Duş Bataryası",
      UnitPriceCategory.kitchenFaucetAndSinkFranke => "Franke Evye ve Batarya",
      UnitPriceCategory.electricalInfrastructure => "Elektrik Tesisat Altyapı İşleri",
      UnitPriceCategory.generatorAksa160 => "Aksa 160 Kva Jeneratör",
      UnitPriceCategory.fullSetFranke => "Franke Ankastre Beyaz Eşya Seti",
      UnitPriceCategory.averageGarden => "Bahçe, Çim, Ağaç vs.",
      UnitPriceCategory.interlockingPavingStone => "Kilit Taşı",
      UnitPriceCategory.carLift => "Araç Asansörü",
      UnitPriceCategory.automaticBarrier => "Otomatik Bariyer",
      UnitPriceCategory.trapezoidalSheetCurtain => "Trapez sac çevre perdesi",
      UnitPriceCategory.mobilizationDemobilization => "Mobilizasyon - Demobilizasyon",
      UnitPriceCategory.crane10Ton => "10 Ton Vinç",
      UnitPriceCategory.siteSafety => "Şantiye güvenlik önlemleri",
      UnitPriceCategory.siteExpenses => "Şantiye, Ofis, Elektrik, Su vb. Giderler",
      UnitPriceCategory.sergeantGrossWage => "Şantiye Çavuşu Brüt Maaş",
      UnitPriceCategory.projectManagerGrossWage => "Proje Müdürü Brüt Maaş",
      UnitPriceCategory.projectsFeesPayments => "Projelerin çizilmesi, resmi harçlar, ödemeler",
    };
  }
}