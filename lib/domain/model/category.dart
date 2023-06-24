import 'package:kost/domain/model/unit.dart';

enum MainCategory {
  excavationJobs, roughConstructionJobs, facadeJobs, interiorJobs, finishingJobs, landscapeJobs, technicalSpecification, projectAndLicenseJobs, generalExpenses
}

extension MainCategoryExtension on MainCategory {
  String get nameTr {
    switch(this) {
      case MainCategory.excavationJobs : return "Hafriyat İşleri";
      case MainCategory.roughConstructionJobs : return "Kaba Yapı İşleri";
      case MainCategory.facadeJobs : return "Cephe İşleri";
      case MainCategory.interiorJobs : return "İç İmalatlar";
      case MainCategory.finishingJobs: return "Montaj İşleri";
      case MainCategory.landscapeJobs : return "Peysaj İşleri";
      case MainCategory.technicalSpecification : return "Teknik Şartname İlaveler";
      case MainCategory.projectAndLicenseJobs : return "Proje ve Ruhsat İşleri";
      case MainCategory.generalExpenses : return "Genel Giderler";
    }
  }
}


enum JobCategory {
  shoring,
  excavation,
  breaker,
  foundationStabilization,
  subFoundationConcrete,
  pouringConcrete,
  rebarWork,
  concreteFormWork,
  hollowFloorFilling,
  foundationWaterproofing,
  curtainWaterproofing,
  curtainProtectionBeforeFilling,
  wallMaterial,
  wallWorkmanShip
}

extension JobCategoryExtension on JobCategory {
  String get nameTr {
    switch(this) {
      case JobCategory.shoring : return "İksa yapılması";
      case JobCategory.excavation : return "Kazı yapılması ve çıkan molozun şantiye dışına gönderilmesi";
      case JobCategory.breaker : return "Kırıcı çalıştırılması";
      case JobCategory.foundationStabilization : return "Temel altına stabilizasyon malzemesinin serilmesi";
      case JobCategory.subFoundationConcrete : return "Temel altı grobeton ve yalıtım koruma betonu atılması";
      case JobCategory.pouringConcrete : return "Betonarme betonu temini ve dökülmesi";
      case JobCategory.rebarWork : return "Ø8-32 mm çapında betonarme çeliği temini ve döşenmesi";
      case JobCategory.concreteFormWork : return "Plywood ile düz yüzeyli beton ve betonarme kalıbı yapılması (Düz Ölçü)";
      case JobCategory.hollowFloorFilling : return "Asmolen döşeme dolgusunun yapılması";
      case JobCategory.foundationWaterproofing : return "Temel altı su yalıtımı yapılması";
      case JobCategory.curtainWaterproofing : return "Perde su yalıtımının yapılması";
      case JobCategory.curtainProtectionBeforeFilling : return "Geri dolgu öncesi perde yalıtımına koruyucu yapılması";
      case JobCategory.wallMaterial : return "Duvar malzeme";
      case JobCategory.wallWorkmanShip : return "Duvar işçilik";
    }
  }
}

enum UnitPriceCategory {
  shutCrete(MainCategory.excavationJobs, JobCategory.shoring, Unit.squareMeters,),
  excavation(MainCategory.excavationJobs, JobCategory.excavation, Unit.cubicMeters,),
  breaker(MainCategory.excavationJobs, JobCategory.breaker, Unit.hour),
  foundationStabilizationGravel(MainCategory.roughConstructionJobs, JobCategory.foundationStabilization, Unit.cubicMeters),
  c16Concrete(MainCategory.roughConstructionJobs, JobCategory.subFoundationConcrete, Unit.cubicMeters),
  plywood(MainCategory.roughConstructionJobs, JobCategory.concreteFormWork, Unit.squareMeters),
  c30Concrete(MainCategory.roughConstructionJobs, JobCategory.pouringConcrete, Unit.cubicMeters),
  c35Concrete(MainCategory.roughConstructionJobs, JobCategory.pouringConcrete, Unit.cubicMeters),
  s420Steel(MainCategory.roughConstructionJobs, JobCategory.rebarWork, Unit.ton),
  eps(MainCategory.roughConstructionJobs, JobCategory.hollowFloorFilling, Unit.cubicMeters),
  doubleLayerBitumenMembrane(MainCategory.roughConstructionJobs, JobCategory.foundationWaterproofing, Unit.squareMeters),
  bitumenSliding(MainCategory.roughConstructionJobs, JobCategory.curtainWaterproofing, Unit.squareMeters),
  drainPlate(MainCategory.roughConstructionJobs, JobCategory.curtainProtectionBeforeFilling, Unit.squareMeters),
  aeratedConcreteMaterial(MainCategory.roughConstructionJobs, JobCategory.wallMaterial, Unit.cubicMeters),
  aeratedConcreteWorkmanShip(MainCategory.roughConstructionJobs, JobCategory.wallWorkmanShip, Unit.squareMeters);

  const UnitPriceCategory(this.mainCategory, this.jobCategory, this.unit,);
  final MainCategory mainCategory;
  final JobCategory jobCategory;
  final Unit unit;
}

extension UnitPriceCategoryExtension on UnitPriceCategory {
  String get nameTr {
    switch(this) {
      case UnitPriceCategory.shutCrete : return "Shutcrete";
      case UnitPriceCategory.excavation : return "Hafriyat";
      case UnitPriceCategory.breaker : return "Kırıcı";
      case UnitPriceCategory.foundationStabilizationGravel : return "Mıcır";
      case UnitPriceCategory.c16Concrete : return "C16 Beton";
      case UnitPriceCategory.plywood : return "Plywood";
      case UnitPriceCategory.c30Concrete : return "C30 Beton";
      case UnitPriceCategory.c35Concrete : return "C35 Beton";
      case UnitPriceCategory.s420Steel : return "S420 Nervürlü İnşaat Demiri";
      case UnitPriceCategory.eps : return "Eps";
      case UnitPriceCategory.doubleLayerBitumenMembrane : return "Bitüm Esaslı Membran (Çift Kat)";
      case UnitPriceCategory.bitumenSliding : return "Bitüm Esaslı Sürme İzolasyon";
      case UnitPriceCategory.drainPlate : return "Drenaj Levhası";
      case UnitPriceCategory.aeratedConcreteMaterial : return "Gazbeton Malzeme";
      case UnitPriceCategory.aeratedConcreteWorkmanShip : return "Gazbeton İşçilik";
    }
  }
}