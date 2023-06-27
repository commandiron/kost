import 'package:kost/domain/model/category/unit.dart';

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
  shoring,
  excavation,
  breaker,
  foundationStabilization,
  subFoundationConcrete,
  concreteFormWork,
  pouringConcrete,
  rebar,
  hollowFloorFilling,
  foundationWaterproofing,
  curtainWaterproofing,
  curtainProtectionBeforeFilling,
  wallMaterial,
  wallWorkmanShip,
  roofing,
  facadeScaffolding,
  windows,
  facadeRails,
  facadeSystem,
  interiorPlastering,
  interiorPainting,
  interiorWaterproofing,
  ceilingCovering,
  covingPlaster,
  screeding,
  marble,
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
      JobCategory.marble => "Mermer zemin kaplamalarının yapılması"
    };
  }
}

enum UnitPriceCategory {
  shutCrete(
    MainCategory.excavationJobs,
    JobCategory.shoring,
    Unit.squareMeters,
  ),
  excavation(
    MainCategory.excavationJobs,
    JobCategory.excavation,
    Unit.cubicMeters,
  ),
  breaker(MainCategory.excavationJobs, JobCategory.breaker, Unit.hour),
  foundationStabilizationGravel(MainCategory.roughConstructionJobs,
      JobCategory.foundationStabilization, Unit.cubicMeters),
  c16Concrete(MainCategory.roughConstructionJobs,
      JobCategory.subFoundationConcrete, Unit.cubicMeters),
  plywood(MainCategory.roughConstructionJobs, JobCategory.concreteFormWork,
      Unit.squareMeters),
  c30Concrete(MainCategory.roughConstructionJobs, JobCategory.pouringConcrete,
      Unit.cubicMeters),
  c35Concrete(MainCategory.roughConstructionJobs, JobCategory.pouringConcrete,
      Unit.cubicMeters),
  s420Steel(MainCategory.roughConstructionJobs, JobCategory.rebar, Unit.ton),
  eps(MainCategory.roughConstructionJobs, JobCategory.hollowFloorFilling,
      Unit.cubicMeters),
  doubleLayerBitumenMembrane(MainCategory.roughConstructionJobs,
      JobCategory.foundationWaterproofing, Unit.squareMeters),
  bitumenSliding(MainCategory.roughConstructionJobs,
      JobCategory.curtainWaterproofing, Unit.squareMeters),
  drainPlate(MainCategory.roughConstructionJobs,
      JobCategory.curtainProtectionBeforeFilling, Unit.squareMeters),
  aeratedConcreteMaterial(MainCategory.roughConstructionJobs,
      JobCategory.wallMaterial, Unit.cubicMeters),
  aeratedConcreteWorkmanShip(MainCategory.roughConstructionJobs,
      JobCategory.wallWorkmanShip, Unit.squareMeters),
  steelConstructionBraasRoof(
      MainCategory.roofJobs, JobCategory.roofing, Unit.squareMeters),
  steelScaffolding(MainCategory.facadeJobs, JobCategory.facadeScaffolding,
      Unit.squareMeters),
  windowJoineryRehau(
      MainCategory.facadeJobs, JobCategory.windows, Unit.squareMeters),
  wroughtIronRailing(
      MainCategory.facadeJobs, JobCategory.facadeRails, Unit.meter),
  ceramicFacade(MainCategory.facadeJobs, JobCategory.facadeSystem, Unit.squareMeters),
  precastFacade(MainCategory.facadeJobs, JobCategory.facadeSystem, Unit.squareMeters),
  plaster(MainCategory.interiorJobs, JobCategory.interiorPlastering,
      Unit.squareMeters),
  painting(MainCategory.interiorJobs, JobCategory.interiorPainting,
      Unit.squareMeters),
  cementBasedFlexInsulation(MainCategory.interiorJobs,
      JobCategory.interiorWaterproofing, Unit.squareMeters),
  drywall(MainCategory.interiorJobs, JobCategory.ceilingCovering,
      Unit.squareMeters),
  covingPlaster(MainCategory.interiorJobs, JobCategory.covingPlaster, Unit.meter),
  screed(MainCategory.interiorJobs, JobCategory.screeding, Unit.squareMeters),
  marbleBilecik(MainCategory.interiorJobs, JobCategory.marble, Unit.squareMeters);

  const UnitPriceCategory(
    this.mainCategory,
    this.jobCategory,
    this.unit,
  );
  final MainCategory mainCategory;
  final JobCategory jobCategory;
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
      UnitPriceCategory.aeratedConcreteWorkmanShip => "Gazbeton İşçilik",
      UnitPriceCategory.steelConstructionBraasRoof => "Çelik konstrüksiyon Braas Çatı",
      UnitPriceCategory.steelScaffolding => "Korkuluklu çelik iskele",
      UnitPriceCategory.windowJoineryRehau => "Rehau sürgülü, Hebeschiebe veya Volkswagen Doğrama",
      UnitPriceCategory.wroughtIronRailing => "Ferforje Korkuluk",
      UnitPriceCategory.ceramicFacade => "Seramik cephe",
      UnitPriceCategory.precastFacade => "Prekast cephe",
      UnitPriceCategory.plaster => "Alçı sıva",
      UnitPriceCategory.painting => "İç mekan boyası",
      UnitPriceCategory.cementBasedFlexInsulation => "Çimento esaslı flex yalıtım malzemesi",
      UnitPriceCategory.drywall => "Alçıpan",
      UnitPriceCategory.covingPlaster => "Kartonpiyer",
      UnitPriceCategory.screed => "Şap",
      UnitPriceCategory.marbleBilecik => "Bilecik Beji"
    };
  }
}
