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
  marbleStep,
  marbleWindowsill,
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
    };
  }
}