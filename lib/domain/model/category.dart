enum MainCategory {
  shoring, excavation, breaker,
}

extension MainCategoryExtension on MainCategory {
  String get name {
    switch(this) {
      case MainCategory.shoring : return "İksa yapılması";
      case MainCategory.excavation : return "Kazı yapılması ve çıkan molozun şantiye dışına gönderilmesi";
      case MainCategory.breaker : return "Kırıcı çalıştırılması";
    }
  }
}

enum JobCategory {
  shutcrete(MainCategory.shoring), excavation(MainCategory.excavation), breaker(MainCategory.breaker);

  const JobCategory(this.mainCategory);
  final MainCategory mainCategory;
}

extension JobCategoryExtension on JobCategory {
  String get name {
    switch(this) {
      case JobCategory.shutcrete : return "Shutcrete";
      case JobCategory.excavation : return "Hafriyat";
      case JobCategory.breaker : return "Kırıcı";
    }
  }
}