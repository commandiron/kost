enum MainCategory {
  excavationJobs,
  roughConstructionJobs,
  roofJobs,
  facadeJobs,
  interiorJobs,
  mechanicalJobs,
  electricalJobs,
  landscapeJobs,
  generalExpenses
}

extension MainCategoryExtension on MainCategory {
  String get nameTr {
    return switch (this) {
      MainCategory.excavationJobs => "Hafriyat İşleri",
      MainCategory.roughConstructionJobs => "Kaba Yapı İşleri",
      MainCategory.roofJobs => "Çatı İşleri",
      MainCategory.facadeJobs => "Cephe İşleri",
      MainCategory.interiorJobs => "İç İmalatlar",
      MainCategory.mechanicalJobs => "Mekanik - Tesisat",
      MainCategory.electricalJobs => "Elektrik",
      MainCategory.landscapeJobs => "Peysaj İşleri",
      MainCategory.generalExpenses => "Genel Giderler"
    };
  }
}

enum JobCategory {
  shoring([UnitPriceCategory.shutCrete]),
  excavation([UnitPriceCategory.excavation]),
  breaker([UnitPriceCategory.breaker]),
  foundationStabilization([UnitPriceCategory.foundationStabilizationGravel]),
  subFoundationConcrete([UnitPriceCategory.c16Concrete]),
  concreteFormWork([UnitPriceCategory.plywood]),
  pouringConcrete([UnitPriceCategory.c30Concrete, UnitPriceCategory.c35Concrete, UnitPriceCategory.c40Concrete]),
  rebar([UnitPriceCategory.s420Steel]),
  hollowFloorFilling([UnitPriceCategory.eps]),
  foundationWaterproofing([UnitPriceCategory.proofBitumenMembrane]),
  curtainWaterproofing([UnitPriceCategory.cementSliding, UnitPriceCategory.bitumenSliding]),
  curtainProtectionBeforeFilling([UnitPriceCategory.drainPlate]),
  wallMaterial([UnitPriceCategory.aeratedConcreteMaterial]),
  wallWorkmanShip([UnitPriceCategory.aeratedConcreteLabor]),
  roofing([UnitPriceCategory.steelConstructionBraasRoof]),
  facadeScaffolding([UnitPriceCategory.steelScaffolding]),
  windows([UnitPriceCategory.windowJoineryRehau]),
  facadeRails([UnitPriceCategory.wroughtIronRailing, UnitPriceCategory.aluminumRailing]),
  facadeSystem([UnitPriceCategory.sinterFlexFacade, UnitPriceCategory.precastFacade]),
  interiorPlastering([UnitPriceCategory.plaster]),
  interiorPainting([UnitPriceCategory.painting]),
  interiorWaterproofing([UnitPriceCategory.cementBasedFlexInsulation]),
  ceilingCovering([UnitPriceCategory.drywall]),
  covingPlaster([UnitPriceCategory.covingPlaster]),
  screeding([UnitPriceCategory.screed]),
  marble([UnitPriceCategory.marbleFloorBilecik]),
  marbleStep([UnitPriceCategory.marbleStepBilecik]),
  marbleWindowsill([UnitPriceCategory.marbleStepBilecik]),
  stairRailings([UnitPriceCategory.aluminumRailing]),
  ceramicTile([UnitPriceCategory.ceramicTileVitraVersus]),
  parquetTile([UnitPriceCategory.laminatedSerifoglu]),
  steelDoor([UnitPriceCategory.steelDoorKale]),
  entranceDoor([UnitPriceCategory.entranceDoor]),
  fireDoor([UnitPriceCategory.ironFireDoor]),
  woodenDoor([UnitPriceCategory.lacqueredDoor]),
  kitchenCupboard([UnitPriceCategory.shinyLacqueredKitchenCupboardAster, UnitPriceCategory.matteLacqueredKitchenCupboardAster]),
  kitchenCounter([UnitPriceCategory.quartzCountertopCimstone]),
  coatCabinet([UnitPriceCategory.lacqueredCabinet]),
  bathroomCabinet([UnitPriceCategory.lacqueredCabinet]),
  floorPlinth([UnitPriceCategory.lacqueredFloorPlinth]),
  mechanicalInfrastructure([UnitPriceCategory.mechanicalInfrastructure]),
  airConditioner([UnitPriceCategory.airConditionerArcelik]),
  ventilation([UnitPriceCategory.ventilation]),
  waterTank([UnitPriceCategory.galvanize25TonWaterTankEsinoks]),
  elevation([UnitPriceCategory.elevation10PersonKone]),
  sink([UnitPriceCategory.sinkVitra]),
  sinkBattery([UnitPriceCategory.sinkBatteryVitra]),
  concealedCistern([UnitPriceCategory.concealedCisternVitra]),
  shower([UnitPriceCategory.showerHuppe]),
  showerBattery([UnitPriceCategory.showerBatteryVitra]),
  kitchenFaucetAndSink([UnitPriceCategory.kitchenFaucetAndSinkFranke]),
  electricalInfrastructure([UnitPriceCategory.electricalInfrastructure]),
  generator([UnitPriceCategory.generatorAksa160]),
  householdAppliances([UnitPriceCategory.paddleBoxBuiltInOvenCookTopDishwasherFranke]),
  landScapeGarden([UnitPriceCategory.averageGarden,]),
  outdoorParkingTile([UnitPriceCategory.interlockingPavingStone]),
  carLift([UnitPriceCategory.carLift]),
  automaticBarrier([UnitPriceCategory.automaticBarrier]),
  enclosingTheLand([UnitPriceCategory.trapezoidalSheetCurtain]),
  mobilizationDemobilization([UnitPriceCategory.mobilizationDemobilization]),
  crane([UnitPriceCategory.crane15Ton]),
  siteSafety([UnitPriceCategory.siteSafety]),
  siteExpenses([UnitPriceCategory.siteExpenses]),
  sergeant([UnitPriceCategory.sergeantGrossWage]),
  projectManager([UnitPriceCategory.projectManagerGrossWage]),
  projectsFeesPayments([UnitPriceCategory.projectsFeesPayments]);

const JobCategory(
    this.unitPriceCategories,
  );
  final List<UnitPriceCategory> unitPriceCategories;
}

extension JobCategoryExtension on JobCategory {
  String get nameTr {
    return switch (this) {
      JobCategory.shoring => "İksa yapılması",
      JobCategory.excavation => "Kazı yapılması ve çıkan molozun şantiye dışına gönderilmesi",
      JobCategory.breaker => "Kırıcı çalıştırılması",
      JobCategory.foundationStabilization => "Temel altına stabilizasyon malzemesinin serilmesi",
      JobCategory.subFoundationConcrete => "Temel altı grobeton ve yalıtım koruma betonu atılması",
      JobCategory.concreteFormWork => "Plywood ile düz yüzeyli beton ve betonarme kalıbı yapılması (Düz Ölçü)",
      JobCategory.pouringConcrete => "Betonarme betonu temini ve dökülmesi",
      JobCategory.rebar => "Ø8-32 mm çapında betonarme çeliği temini ve döşenmesi",
      JobCategory.hollowFloorFilling => "Asmolen döşeme dolgusunun yapılması",
      JobCategory.foundationWaterproofing => "Temel altı su yalıtımı yapılması",
      JobCategory.curtainWaterproofing => "Perde su yalıtımının yapılması",
      JobCategory.curtainProtectionBeforeFilling => "Geri dolgu öncesi perde yalıtımına koruyucu yapılması",
      JobCategory.wallMaterial => "Duvar malzeme",
      JobCategory.wallWorkmanShip => "Duvar işçilik",
      JobCategory.roofing => "Çatı Yapılması",
      JobCategory.facadeScaffolding => "Cephe için iş iskelesi kurulması ve daha sonra sökülmesi (6ay)",
      JobCategory.windows => "Pencere ve Doğramaların yapılması",
      JobCategory.facadeRails => "Cephe korkuluklarının yapılması",
      JobCategory.facadeSystem => "Cephe kaplama sisteminin yapılması",
      JobCategory.interiorPlastering => "İç mekan sıvasının yapılması (Kaba + İnce)",
      JobCategory.interiorPainting => "İç mekan boyasının yapılması",
      JobCategory.interiorWaterproofing => "İç mekan su yalıtımı yapılması",
      JobCategory.ceilingCovering => "Tavan kaplamalarının yapılması",
      JobCategory.covingPlaster => "Kartonpiyer yapılması",
      JobCategory.screeding => "Şap yapılması",
      JobCategory.marble => "Mermer zemin kaplamalarının yapılması",
      JobCategory.marbleStep => "Mermer basamakların yapılması",
      JobCategory.marbleWindowsill => "Mermer denizliklerin yapılması",
      JobCategory.stairRailings => "Merdiven korkuluklarının yapılması",
      JobCategory.ceramicTile => "Seramik kaplama yapılması",
      JobCategory.parquetTile => "Parke kaplama yapılması",
      JobCategory.steelDoor => "Daire çelik kapıların yapılması",
      JobCategory.entranceDoor => "Apartman giriş kapısının yapılması",
      JobCategory.fireDoor => "Yangın kapılarının yapılması",
      JobCategory.woodenDoor => "Ahşap kapıların yapılması",
      JobCategory.kitchenCupboard => "Mutfak Dolabı",
      JobCategory.kitchenCounter => "Mutfak Tezgahı",
      JobCategory.coatCabinet => "Portmanto",
      JobCategory.bathroomCabinet => "Banyo Dolabı",
      JobCategory.floorPlinth => "Süpürgelik",
      JobCategory.mechanicalInfrastructure => "Mekanik Altyapı İşleri",
      JobCategory.airConditioner => "Klima işleri",
      JobCategory.ventilation => "Havalandırma işleri",
      JobCategory.waterTank => "Su Deposu",
      JobCategory.elevation => "Asansör",
      JobCategory.sink => "Lavabo",
      JobCategory.sinkBattery => "Lavabo bataryası",
      JobCategory.concealedCistern => "Gömme rezervuar ve tuvalet taşı",
      JobCategory.shower => "Duşakabin",
      JobCategory.showerBattery => "Duş bataryasu",
      JobCategory.kitchenFaucetAndSink => "Mutfak bataryası ve evye",
      JobCategory.electricalInfrastructure => "Elektrik Altyapı",
      JobCategory.generator => "Jeneratör",
      JobCategory.householdAppliances => "Beyaz Eşya",
      JobCategory.landScapeGarden => "Bahçe Yapımı",
      JobCategory.outdoorParkingTile => "Açık Otopark Kaplama",
      JobCategory.carLift => "Araç Asansörü",
      JobCategory.automaticBarrier => "Garaj Otomatik Bariyer",
      JobCategory.enclosingTheLand => "Mevcut yapının etrafının kapatılması",
      JobCategory.mobilizationDemobilization => "Mobilizasyon - Demobilizasyon",
      JobCategory.crane => "Vinç",
      JobCategory.siteSafety => "Şantiye güvenlik önlemleri",
      JobCategory.siteExpenses => "Şantiye Giderleri",
      JobCategory.sergeant => "Şantiye Çavuşu",
      JobCategory.projectManager => "Proje Müdürü",
      JobCategory.projectsFeesPayments => "Projelerin çizilmesi, resmi harçlar ve ödemeler",
    };
  }
}

enum UnitPriceCategory {
  shutCrete,
  excavation,
  breaker,
  foundationStabilizationGravel,
  c16Concrete,
  plywood,
  c30Concrete,
  c35Concrete,
  c40Concrete,
  s420Steel,
  eps,
  proofBitumenMembrane,
  bitumenSliding,
  cementSliding,
  drainPlate,
  aeratedConcreteMaterial,
  aeratedConcreteLabor,
  steelConstructionBraasRoof,
  steelScaffolding,
  windowJoineryRehau,
  wroughtIronRailing,
  aluminumRailing,
  sinterFlexFacade,
  precastFacade,
  plaster,
  painting,
  cementBasedFlexInsulation,
  drywall,
  covingPlaster,
  screed,
  marbleFloorBilecik,
  marbleStepBilecik,
  marbleWindowsillBilecik,
  ceramicTileVitraVersus,
  laminatedSerifoglu,
  steelDoorKale,
  entranceDoor,
  ironFireDoor,
  lacqueredDoor,
  shinyLacqueredKitchenCupboardAster,
  matteLacqueredKitchenCupboardAster,
  quartzCountertopCimstone,
  lacqueredCabinet,
  lacqueredFloorPlinth,
  mechanicalInfrastructure,
  airConditionerArcelik,
  ventilation,
  galvanize25TonWaterTankEsinoks,
  elevation10PersonKone,
  elevation6PersonKone,
  sinkVitra,
  sinkBatteryVitra,
  concealedCisternVitra,
  showerHuppe,
  showerBatteryVitra,
  kitchenFaucetAndSinkFranke,
  electricalInfrastructure,
  generatorAksa160,
  paddleBoxBuiltInOvenCookTopDishwasherFranke,
  averageGarden,
  interlockingPavingStone,
  carLift,
  automaticBarrier,
  trapezoidalSheetCurtain,
  mobilizationDemobilization,
  crane15Ton,
  siteSafety,
  siteExpenses,
  sergeantGrossWage,
  projectManagerGrossWage,
  projectsFeesPayments;
}