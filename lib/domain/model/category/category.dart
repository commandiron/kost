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
  aeratedConcreteWorkmanShip(Unit.squareMeters),
  steelConstructionBraasRoof(Unit.squareMeters),
  steelScaffolding(Unit.squareMeters),
  windowJoineryRehau(Unit.squareMeters),
  wroughtIronRailing(Unit.meter),
  ceramicFacade(Unit.squareMeters),
  precastFacade(Unit.squareMeters),
  plaster(Unit.squareMeters),
  painting(Unit.squareMeters),
  cementBasedFlexInsulation(Unit.squareMeters),
  drywall(Unit.squareMeters),
  covingPlaster(Unit.meter),
  screed(Unit.squareMeters),
  marbleBilecik(Unit.squareMeters);

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

enum CostCategory {
  a1(
    MainCategory.excavationJobs, JobCategory.excavation, UnitPriceCategory.shutCrete,
  ),
  a2(
    MainCategory.excavationJobs, JobCategory.excavation, UnitPriceCategory.excavation,
  ),
  a3(
    MainCategory.excavationJobs, JobCategory.breaker, UnitPriceCategory.breaker,
  ),
  b1(
    MainCategory.roughConstructionJobs, JobCategory.foundationStabilization, UnitPriceCategory.foundationStabilizationGravel,
  ),
  b2(
    MainCategory.roughConstructionJobs, JobCategory.subFoundationConcrete, UnitPriceCategory.c16Concrete,
  ),
  b3(
    MainCategory.roughConstructionJobs, JobCategory.concreteFormWork, UnitPriceCategory.plywood,
  ),
  b4(
    MainCategory.roughConstructionJobs, JobCategory.pouringConcrete, UnitPriceCategory.c30Concrete,
  ),
  b5(
    MainCategory.roughConstructionJobs, JobCategory.pouringConcrete, UnitPriceCategory.c35Concrete,
  ),
  b6(
    MainCategory.roughConstructionJobs, JobCategory.rebar, UnitPriceCategory.s420Steel,
  ),
  b7(
    MainCategory.roughConstructionJobs, JobCategory.hollowFloorFilling, UnitPriceCategory.eps,
  ),
  b8(
    MainCategory.roughConstructionJobs, JobCategory.foundationWaterproofing, UnitPriceCategory.doubleLayerBitumenMembrane,
  ),
  b9(
    MainCategory.roughConstructionJobs, JobCategory.curtainWaterproofing, UnitPriceCategory.bitumenSliding,
  ),
  b10(
    MainCategory.roughConstructionJobs, JobCategory.curtainProtectionBeforeFilling, UnitPriceCategory.drainPlate,
  ),
  b11(
    MainCategory.roughConstructionJobs, JobCategory.wallMaterial, UnitPriceCategory.aeratedConcreteMaterial,
  ),
  b12(
    MainCategory.roughConstructionJobs, JobCategory.wallWorkmanShip, UnitPriceCategory.aeratedConcreteWorkmanShip,
  ),
  c1(
    MainCategory.roofJobs, JobCategory.roofing, UnitPriceCategory.steelConstructionBraasRoof,
  ),
  d1(
    MainCategory.facadeJobs, JobCategory.facadeScaffolding, UnitPriceCategory.steelScaffolding,
  ),
  d2(
    MainCategory.facadeJobs, JobCategory.windows, UnitPriceCategory.windowJoineryRehau,
  ),
  d3(
    MainCategory.facadeJobs, JobCategory.facadeRails, UnitPriceCategory.wroughtIronRailing,
  ),
  d4(
    MainCategory.facadeJobs, JobCategory.facadeSystem, UnitPriceCategory.ceramicFacade,
  ),
  d5(
    MainCategory.facadeJobs, JobCategory.facadeSystem, UnitPriceCategory.precastFacade,
  ),
  e1(
    MainCategory.interiorJobs, JobCategory.interiorPlastering, UnitPriceCategory.plaster,
  ),
  e2(
    MainCategory.interiorJobs, JobCategory.interiorPainting, UnitPriceCategory.painting,
  ),
  e3(
    MainCategory.interiorJobs, JobCategory.interiorWaterproofing, UnitPriceCategory.cementBasedFlexInsulation,
  ),
  e4(
    MainCategory.interiorJobs, JobCategory.ceilingCovering, UnitPriceCategory.drywall,
  ),
  e5(
    MainCategory.interiorJobs, JobCategory.covingPlaster, UnitPriceCategory.covingPlaster,
  ),
  e6(
    MainCategory.interiorJobs, JobCategory.screeding, UnitPriceCategory.screed,
  ),
  e7(
    MainCategory.interiorJobs, JobCategory.marble, UnitPriceCategory.marbleBilecik,
  );
  const CostCategory(
    this.mainCategory,
    this.jobCategory,
    this.unitPriceCategory,
  );
  final MainCategory mainCategory;
  final JobCategory jobCategory;
  final UnitPriceCategory unitPriceCategory;
}
