import '../unit_price/unit_price_category.dart';

enum MainCategory {
  excavationJobs,
  roughConstructionJobs,
  roofJobs,
  facadeJobs,
  interiorJobs,
  finishingJobs,
  landscapeJobs,
  technicalSpecification,
  projectAndLicenseJobs,
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
      MainCategory.finishingJobs => "Montaj İşleri",
      MainCategory.landscapeJobs => "Peysaj İşleri",
      MainCategory.technicalSpecification => "Teknik Şartname İlaveler",
      MainCategory.projectAndLicenseJobs => "Proje ve Ruhsat İşleri",
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
  pouringConcrete([UnitPriceCategory.c30Concrete, UnitPriceCategory.c35Concrete]),
  rebar([UnitPriceCategory.s420Steel]),
  hollowFloorFilling([UnitPriceCategory.eps]),
  foundationWaterproofing([UnitPriceCategory.doubleLayerBitumenMembrane]),
  curtainWaterproofing([UnitPriceCategory.bitumenSliding]),
  curtainProtectionBeforeFilling([UnitPriceCategory.drainPlate]),
  wallMaterial([UnitPriceCategory.aeratedConcreteMaterial]),
  wallWorkmanShip([UnitPriceCategory.aeratedConcreteLabor]),
  roofing([UnitPriceCategory.steelConstructionBraasRoof]),
  facadeScaffolding([UnitPriceCategory.steelScaffolding]),
  windows([UnitPriceCategory.windowJoineryRehau]),
  facadeRails([UnitPriceCategory.wroughtIronRailing, UnitPriceCategory.aluminumRailing]),
  facadeSystem([UnitPriceCategory.ceramicFacade, UnitPriceCategory.precastFacade]),
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
  ceramicTile([UnitPriceCategory.ceramicTileEge]),
  parquetTile([UnitPriceCategory.laminatedSerifoglu]),
  steelDoor([UnitPriceCategory.steelDoorKale]),
  woodenDoor([UnitPriceCategory.lacqueredDoor]),
  entranceDoor([UnitPriceCategory.entranceDoor]),
  fireDoor([UnitPriceCategory.ironFireDoor]),
  airConditioner([UnitPriceCategory.airConditionerArcelik]);

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
      JobCategory.woodenDoor => "Ahşap kapıların yapılması",
      JobCategory.entranceDoor => "Apartman giriş kapısının yapılması",
      JobCategory.fireDoor => "Yangın kapılarının yapılması",
      JobCategory.airConditioner => "Klima işleri"
    };
  }
}