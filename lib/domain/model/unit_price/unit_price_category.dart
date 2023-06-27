import 'package:kost/domain/model/unit_price/unit.dart';

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