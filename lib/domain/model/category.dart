enum MainCategory {
  shoring, excavation, breaker, foundationStabilization
}

extension MainCategoryExtension on MainCategory {
  String get name {
    switch(this) {
      case MainCategory.shoring : return "İksa yapılması";
      case MainCategory.excavation : return "Kazı yapılması ve çıkan molozun şantiye dışına gönderilmesi";
      case MainCategory.breaker : return "Kırıcı çalıştırılması";
      case MainCategory.foundationStabilization : return "Temel altına stabilizasyon malzemesinin serilmesi";
    }
  }
}

enum JobCategory {
  shutcrete(MainCategory.shoring), excavation(MainCategory.excavation), breaker(MainCategory.breaker), foundationStabilizationGravel(MainCategory.foundationStabilization);

  const JobCategory(this.mainCategory);
  final MainCategory mainCategory;
}

extension JobCategoryExtension on JobCategory {
  String get name {
    switch(this) {
      case JobCategory.shutcrete : return "Shutcrete";
      case JobCategory.excavation : return "Hafriyat";
      case JobCategory.breaker : return "Kırıcı";
      case JobCategory.foundationStabilizationGravel : return "Mıcır";
    }
  }
}