enum MainCategory {
  excavationJobs, roughConstructionJobs, facadeJobs, interiorJobs, finishingJobs, landscapeJobs, technicalSpecification, projectAndLicenseJobs, generalExpenses
}

extension MainCategoryExtension on MainCategory {
  String get name {
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
  shoring, excavation, breaker, foundationStabilization
}

extension JobCategoryExtension on JobCategory {
  String get name {
    switch(this) {
      case JobCategory.shoring : return "İksa yapılması";
      case JobCategory.excavation : return "Kazı yapılması ve çıkan molozun şantiye dışına gönderilmesi";
      case JobCategory.breaker : return "Kırıcı çalıştırılması";
      case JobCategory.foundationStabilization : return "Temel altına stabilizasyon malzemesinin serilmesi";
    }
  }
}

enum UnitPriceCategory {
  shutcrete(MainCategory.excavationJobs, JobCategory.shoring),
  excavation(MainCategory.excavationJobs, JobCategory.excavation),
  breaker(MainCategory.excavationJobs, JobCategory.breaker),
  foundationStabilizationGravel(MainCategory.roughConstructionJobs, JobCategory.foundationStabilization);

  const UnitPriceCategory(this.mainCategory, this.jobCategory);
  final MainCategory mainCategory;
  final JobCategory jobCategory;
}

extension UnitPriceCategoryExtension on UnitPriceCategory {
  String get name {
    switch(this) {
      case UnitPriceCategory.shutcrete : return "Shutcrete";
      case UnitPriceCategory.excavation : return "Hafriyat";
      case UnitPriceCategory.breaker : return "Kırıcı";
      case UnitPriceCategory.foundationStabilizationGravel : return "Mıcır";
    }
  }
}