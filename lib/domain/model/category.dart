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
  shoring, excavation, breaker, foundationStabilization, subFoundationConcrete, pouringConcrete
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
    }
  }
}

enum UnitPriceCategory {
  shutcrete(MainCategory.excavationJobs, JobCategory.shoring),
  excavation(MainCategory.excavationJobs, JobCategory.excavation),
  breaker(MainCategory.excavationJobs, JobCategory.breaker),
  foundationStabilizationGravel(MainCategory.roughConstructionJobs, JobCategory.foundationStabilization),
  c16Concrete(MainCategory.roughConstructionJobs, JobCategory.subFoundationConcrete),
  c30Concrete(MainCategory.roughConstructionJobs, JobCategory.pouringConcrete),
  c35Concrete(MainCategory.roughConstructionJobs, JobCategory.pouringConcrete);

  const UnitPriceCategory(this.mainCategory, this.jobCategory);
  final MainCategory mainCategory;
  final JobCategory jobCategory;
}

extension UnitPriceCategoryExtension on UnitPriceCategory {
  String get nameTr {
    switch(this) {
      case UnitPriceCategory.shutcrete : return "Shutcrete";
      case UnitPriceCategory.excavation : return "Hafriyat";
      case UnitPriceCategory.breaker : return "Kırıcı";
      case UnitPriceCategory.foundationStabilizationGravel : return "Mıcır";
      case UnitPriceCategory.c16Concrete : return "C16 Beton";
      case UnitPriceCategory.c30Concrete : return "C30 Beton";
      case UnitPriceCategory.c35Concrete : return "C35 Beton";
    }
  }
}