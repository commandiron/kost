import 'package:kost/common/model/unit_price_category.dart';
import 'package:uuid/uuid.dart';

abstract class Job {
  Job({
    required this.nameTr,
    required this.mainCategory,
    required this.enabledUnitPriceCategories,
    required this.selectedUnitPriceCategory,
    this.replacedUnitPriceId,
    required this.quantityBuilder,
    this.disable = false,
  });
  String id = const Uuid().v4();
  final String nameTr;
  final MainCategory mainCategory;
  List<UnitPriceCategory> enabledUnitPriceCategories;
  UnitPriceCategory selectedUnitPriceCategory;
  String? replacedUnitPriceId;
  double Function() quantityBuilder;
  bool disable;
}

enum MainCategory {
  excavationJobs,
  roughConstructionJobs,
  roofJobs,
  facadeJobs,
  interiorJobs,
  mechanicalJobs,
  electricalJobs,
  landscapeJobs,
  generalExpenses
}

extension MainCategoryExtension on MainCategory {
  String get id {
    return switch (this) {
      MainCategory.excavationJobs => "A",
      MainCategory.roughConstructionJobs => "B",
      MainCategory.roofJobs => "C",
      MainCategory.facadeJobs => "D",
      MainCategory.interiorJobs => "E",
      MainCategory.mechanicalJobs => "F",
      MainCategory.electricalJobs => "G",
      MainCategory.landscapeJobs => "H",
      MainCategory.generalExpenses => "I"
    };
  }
  String get nameTr {
    return switch (this) {
      MainCategory.excavationJobs => "Hafriyat İşleri",
      MainCategory.roughConstructionJobs => "Kaba Yapı İşleri",
      MainCategory.roofJobs => "Çatı İşleri",
      MainCategory.facadeJobs => "Cephe İşleri",
      MainCategory.interiorJobs => "İç İmalatlar",
      MainCategory.mechanicalJobs => "Mekanik Tesisat",
      MainCategory.electricalJobs => "Elektrik Tesisat",
      MainCategory.landscapeJobs => "Peysaj İşleri",
      MainCategory.generalExpenses => "Genel Giderler"
    };
  }
}

class Shoring extends Job {
  Shoring(
    {
      super.nameTr = "İksa Yapılması",
      super.mainCategory = MainCategory.excavationJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.shutCrete],
      super.selectedUnitPriceCategory = UnitPriceCategory.shutCrete,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class Excavation extends Job {
  Excavation(
    {
      super.nameTr = "Kazı Yapılması",
      super.mainCategory = MainCategory.excavationJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.excavation],
      super.selectedUnitPriceCategory = UnitPriceCategory.excavation,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class Breaker extends Job {
  Breaker(
    {
      super.nameTr = "Kırıcı Çalıştırılması",
      super.mainCategory = MainCategory.excavationJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.breaker],
      super.selectedUnitPriceCategory = UnitPriceCategory.breaker,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class FoundationStabilization extends Job {
  FoundationStabilization(
    {
      super.nameTr = "Temel altına stabilizasyon malzemesinin serilmesi",
      super.mainCategory = MainCategory.roughConstructionJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.foundationStabilizationGravel],
      super.selectedUnitPriceCategory = UnitPriceCategory.foundationStabilizationGravel,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class SubFoundationConcreteMaterial extends Job {
  SubFoundationConcreteMaterial(
    {
      super.nameTr = "Temel altı grobeton ve yalıtım koruma betonu temini",
      super.mainCategory = MainCategory.roughConstructionJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.c16Concrete],
      super.selectedUnitPriceCategory = UnitPriceCategory.c16Concrete,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class ReinforcedConcreteWorkmanshipWithFormWorkMaterial extends Job {
  ReinforcedConcreteWorkmanshipWithFormWorkMaterial(
    {
      super.nameTr = "Betonarme işçiliği ile beton kalıbı malzeme temini",
      super.mainCategory = MainCategory.roughConstructionJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.reinforcedConcreteWorkmanshipWithPlywood],
      super.selectedUnitPriceCategory = UnitPriceCategory.reinforcedConcreteWorkmanshipWithPlywood,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class ConcreteMaterial extends Job {
  ConcreteMaterial(
    {
      super.nameTr = "Betonarme betonu temini",
      super.mainCategory = MainCategory.roughConstructionJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.c30Concrete, UnitPriceCategory.c35Concrete, UnitPriceCategory.c40Concrete],
      super.selectedUnitPriceCategory = UnitPriceCategory.c35Concrete,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class RebarMaterial extends Job {
  RebarMaterial(
    {
      super.nameTr = "Ø8-32 mm çapında betonarme çeliği temini",
      super.mainCategory = MainCategory.roughConstructionJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.s420Steel],
      super.selectedUnitPriceCategory = UnitPriceCategory.s420Steel,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class HollowFloorFillingMaterial extends Job {
  HollowFloorFillingMaterial(
    {
      super.nameTr = "Asmolen döşeme dolgusu temini",
      super.mainCategory = MainCategory.roughConstructionJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.eps14Dns],
      super.selectedUnitPriceCategory = UnitPriceCategory.eps14Dns,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class FoundationWaterproofing extends Job {
  FoundationWaterproofing(
    {
      super.nameTr = "Temel altı su yalıtımı yapılması",
      super.mainCategory = MainCategory.roughConstructionJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.proofBitumenMembrane],
      super.selectedUnitPriceCategory = UnitPriceCategory.proofBitumenMembrane,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class CurtainWaterproofing extends Job {
  CurtainWaterproofing(
    {
      super.nameTr = "Perde su yalıtımının yapılması",
      super.mainCategory = MainCategory.roughConstructionJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.cementSliding, UnitPriceCategory.bitumenSliding],
      super.selectedUnitPriceCategory = UnitPriceCategory.cementSliding,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class CurtainProtectionBeforeFilling extends Job {
  CurtainProtectionBeforeFilling(
    {
      super.nameTr = "Geri dolgu öncesi perde yalıtımına koruyucu yapılması",
      super.mainCategory = MainCategory.roughConstructionJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.drainPlate],
      super.selectedUnitPriceCategory =UnitPriceCategory.drainPlate,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class Wall extends Job {
  Wall(
    {
      super.nameTr = "Duvar malzeme",
      super.mainCategory = MainCategory.roughConstructionJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.aeratedConcreteYtong],
      super.selectedUnitPriceCategory = UnitPriceCategory.aeratedConcreteYtong,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class WallWorkmanShip extends Job {
  WallWorkmanShip(
    {
      super.nameTr = "Duvar işçilik",
      super.mainCategory = MainCategory.roughConstructionJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.aeratedConcreteLabor],
      super.selectedUnitPriceCategory = UnitPriceCategory.aeratedConcreteLabor,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class Roofing extends Job {
  Roofing(
    {
      super.nameTr = "Çatı Yapılması",
      super.mainCategory = MainCategory.roofJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.steelConstructionBraasRoof],
      super.selectedUnitPriceCategory = UnitPriceCategory.steelConstructionBraasRoof,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class FacadeScaffolding extends Job {
  FacadeScaffolding(
    {
      super.nameTr = "Cephe için iş iskelesi kurulması ve daha sonra sökülmesi (6ay)",
      super.mainCategory = MainCategory.facadeJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.steelScaffolding],
      super.selectedUnitPriceCategory = UnitPriceCategory.steelScaffolding,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class Windows extends Job {
  Windows(
    {
      super.nameTr = "Pencere ve Doğramaların yapılması",
      super.mainCategory = MainCategory.facadeJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.windowJoineryRehau],
      super.selectedUnitPriceCategory = UnitPriceCategory.windowJoineryRehau,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class FacadeRails extends Job {
  FacadeRails(
    {
      super.nameTr = "Cephe korkuluklarının yapılması",
      super.mainCategory = MainCategory.facadeJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.wroughtIronRailing, UnitPriceCategory.aluminumRailing],
      super.selectedUnitPriceCategory = UnitPriceCategory.wroughtIronRailing,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class FacadeSystem extends Job {
  FacadeSystem(
    {
      super.nameTr = "Cephe kaplama sisteminin yapılması",
      super.mainCategory = MainCategory.facadeJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.sinterFlex4Facade, UnitPriceCategory.precast3FacadePlaster1Facade],
      super.selectedUnitPriceCategory = UnitPriceCategory.sinterFlex4Facade,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class InteriorPlastering extends Job {
  InteriorPlastering(
    {
      super.nameTr = "İç mekan sıvasının yapılması (Kaba + İnce)",
      super.mainCategory = MainCategory.interiorJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.plaster],
      super.selectedUnitPriceCategory = UnitPriceCategory.plaster,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class InteriorPainting extends Job {
  InteriorPainting(
    {
      super.nameTr = "İç mekan boyasının yapılması",
      super.mainCategory = MainCategory.interiorJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.painting],
      super.selectedUnitPriceCategory = UnitPriceCategory.painting,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class InteriorWaterproofing extends Job {
  InteriorWaterproofing(
    {
      super.nameTr = "İç mekan su yalıtımı yapılması",
      super.mainCategory = MainCategory.interiorJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.cementBasedFlexInsulation],
      super.selectedUnitPriceCategory = UnitPriceCategory.cementBasedFlexInsulation,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class CeilingCovering extends Job {
  CeilingCovering(
    {
      super.nameTr = "Tavan kaplamalarının yapılması",
      super.mainCategory = MainCategory.interiorJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.drywall],
      super.selectedUnitPriceCategory = UnitPriceCategory.drywall,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class CovingPlaster extends Job {
  CovingPlaster(
    {
      super.nameTr = "Kartonpiyer yapılması",
      super.mainCategory = MainCategory.interiorJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.covingPlaster],
      super.selectedUnitPriceCategory = UnitPriceCategory.covingPlaster,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class Screeding extends Job {
  Screeding(
    {
      super.nameTr = "Şap yapılması",
      super.mainCategory = MainCategory.interiorJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.screed300Doses],
      super.selectedUnitPriceCategory = UnitPriceCategory.screed300Doses,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class Marble extends Job {
  Marble(
    {
      super.nameTr = "Mermer zemin kaplamalarının yapılması",
      super.mainCategory = MainCategory.interiorJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.marbleFloorBilecik],
      super.selectedUnitPriceCategory = UnitPriceCategory.marbleFloorBilecik,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class MarbleStep extends Job {
  MarbleStep(
    {
      super.nameTr = "Mermer basamakların yapılması",
      super.mainCategory = MainCategory.interiorJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.marbleStepBilecik],
      super.selectedUnitPriceCategory = UnitPriceCategory.marbleStepBilecik,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class MarbleWindowsill extends Job {
  MarbleWindowsill(
    {
      super.nameTr = "Mermer denizliklerin yapılması",
      super.mainCategory = MainCategory.interiorJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.marbleWindowsillBilecik],
      super.selectedUnitPriceCategory = UnitPriceCategory.marbleWindowsillBilecik,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class StairRailings extends Job {
  StairRailings(
    {
      super.nameTr = "Merdiven korkuluklarının yapılması",
      super.mainCategory = MainCategory.interiorJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.aluminumRailing],
      super.selectedUnitPriceCategory = UnitPriceCategory.aluminumRailing,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class CeramicTile extends Job {
  CeramicTile(
    {
      super.nameTr = "Seramik kaplama yapılması",
      super.mainCategory = MainCategory.interiorJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.ceramicTileVitraVersus],
      super.selectedUnitPriceCategory = UnitPriceCategory.ceramicTileVitraVersus,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class ParquetTile extends Job {
  ParquetTile(
    {
      super.nameTr = "Parke kaplama yapılması",
      super.mainCategory = MainCategory.interiorJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.laminatedSerifoglu],
      super.selectedUnitPriceCategory = UnitPriceCategory.laminatedSerifoglu,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class SteelDoor extends Job {
  SteelDoor(
    {
      super.nameTr = "Daire çelik kapıların yapılması",
      super.mainCategory = MainCategory.interiorJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.steelDoorKale],
      super.selectedUnitPriceCategory = UnitPriceCategory.steelDoorKale,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class EntranceDoor extends Job {
  EntranceDoor(
    {
      super.nameTr = "Apartman giriş kapısının yapılması",
      super.mainCategory = MainCategory.interiorJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.entranceDoor],
      super.selectedUnitPriceCategory = UnitPriceCategory.entranceDoor,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class FireDoor extends Job {
  FireDoor(
    {
      super.nameTr = "Yangın kapılarının yapılması",
      super.mainCategory = MainCategory.interiorJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.ironFireDoor],
      super.selectedUnitPriceCategory = UnitPriceCategory.ironFireDoor,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class WoodenDoor extends Job {
  WoodenDoor(
    {
      super.nameTr = "Ahşap kapıların yapılması",
      super.mainCategory = MainCategory.interiorJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.lacqueredDoorArtella],
      super.selectedUnitPriceCategory = UnitPriceCategory.lacqueredDoorArtella,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class KitchenCupboard extends Job {
  KitchenCupboard(
    {
      super.nameTr = "Mutfak Dolabı",
      super.mainCategory = MainCategory.interiorJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.shinyLacqueredKitchenCupboardAster, UnitPriceCategory.matteLacqueredKitchenCupboardAster],
      super.selectedUnitPriceCategory = UnitPriceCategory.shinyLacqueredKitchenCupboardAster,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class KitchenCounter extends Job {
  KitchenCounter(
    {
      super.nameTr = "Mutfak Tezgahı",
      super.mainCategory = MainCategory.interiorJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.quartzCountertopCimstone],
      super.selectedUnitPriceCategory = UnitPriceCategory.quartzCountertopCimstone,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class CoatCabinet extends Job {
  CoatCabinet(
    {
      super.nameTr = "Portmanto",
      super.mainCategory = MainCategory.interiorJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.lacqueredCabinet],
      super.selectedUnitPriceCategory = UnitPriceCategory.lacqueredCabinet,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class BathroomCabinet extends Job {
  BathroomCabinet(
    {
      super.nameTr = "Banyo Dolabı",
      super.mainCategory = MainCategory.interiorJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.lacqueredCabinet],
      super.selectedUnitPriceCategory = UnitPriceCategory.lacqueredCabinet,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class FloorPlinth extends Job {
  FloorPlinth(
    {
      super.nameTr = "Süpürgelik",
      super.mainCategory = MainCategory.interiorJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.lacqueredFloorPlinth],
      super.selectedUnitPriceCategory = UnitPriceCategory.lacqueredFloorPlinth,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class MechanicalInfrastructure extends Job {
  MechanicalInfrastructure(
    {
      super.nameTr = "Mekanik Altyapı İşleri",
      super.mainCategory = MainCategory.mechanicalJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.mechanicalInfrastructure],
      super.selectedUnitPriceCategory = UnitPriceCategory.mechanicalInfrastructure,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class AirConditioner extends Job {
  AirConditioner(
    {
      super.nameTr = "Mekanik Altyapı İşleri",
      super.mainCategory = MainCategory.mechanicalJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.airConditionerArcelik, UnitPriceCategory.vrfMultiSplitMitsubishiElectric],
      super.selectedUnitPriceCategory = UnitPriceCategory.airConditionerArcelik,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class Ventilation extends Job {
  Ventilation(
    {
      super.nameTr = "Havalandırma işleri",
      super.mainCategory = MainCategory.mechanicalJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.ventilation],
      super.selectedUnitPriceCategory = UnitPriceCategory.ventilation,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class WaterTank extends Job {
  WaterTank(
    {
      super.nameTr = "Su Deposu",
      super.mainCategory = MainCategory.mechanicalJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.galvanize25TonWaterTankEsinoks],
      super.selectedUnitPriceCategory = UnitPriceCategory.galvanize25TonWaterTankEsinoks,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class Elevation extends Job {
  Elevation(
    {
      super.nameTr = "Asansör",
      super.mainCategory = MainCategory.mechanicalJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.elevation10PersonKone, UnitPriceCategory.elevation6PersonKone],
      super.selectedUnitPriceCategory = UnitPriceCategory.elevation10PersonKone,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class Sink extends Job {
  Sink(
    {
      super.nameTr = "Lavabo",
      super.mainCategory = MainCategory.mechanicalJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.sinkVitra],
      super.selectedUnitPriceCategory = UnitPriceCategory.sinkVitra,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class SinkBattery extends Job {
  SinkBattery(
    {
      super.nameTr = "Lavabo bataryası",
      super.mainCategory = MainCategory.mechanicalJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.sinkBatteryVitra],
      super.selectedUnitPriceCategory = UnitPriceCategory.sinkBatteryVitra,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class ConcealedCistern extends Job {
  ConcealedCistern(
    {
      super.nameTr = "Gömme rezervuar ve tuvalet taşı",
      super.mainCategory = MainCategory.mechanicalJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.concealedCisternVitra],
      super.selectedUnitPriceCategory = UnitPriceCategory.concealedCisternVitra,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class Shower extends Job {
  Shower(
    {
      super.nameTr = "Duşakabin",
      super.mainCategory = MainCategory.mechanicalJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.showerHuppe100x100],
      super.selectedUnitPriceCategory = UnitPriceCategory.showerHuppe100x100,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class ShowerBattery extends Job {
  ShowerBattery(
    {
      super.nameTr = "Duş bataryası",
      super.mainCategory = MainCategory.mechanicalJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.showerBatteryVitra],
      super.selectedUnitPriceCategory = UnitPriceCategory.showerBatteryVitra,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class KitchenFaucetAndSink extends Job {
  KitchenFaucetAndSink(
    {
      super.nameTr = "Mutfak bataryası ve evye",
      super.mainCategory = MainCategory.mechanicalJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.kitchenFaucetAndSinkFranke],
      super.selectedUnitPriceCategory = UnitPriceCategory.kitchenFaucetAndSinkFranke,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class ElectricalInfrastructure extends Job {
  ElectricalInfrastructure(
    {
      super.nameTr = "Elektrik Altyapı",
      super.mainCategory = MainCategory.electricalJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.electricalInfrastructure],
      super.selectedUnitPriceCategory = UnitPriceCategory.electricalInfrastructure,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class Generator extends Job {
  Generator(
    {
      super.nameTr = "Jeneratör",
      super.mainCategory = MainCategory.electricalJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.generatorAksa160],
      super.selectedUnitPriceCategory = UnitPriceCategory.generatorAksa160,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class HouseholdAppliances extends Job {
  HouseholdAppliances(
    {
      super.nameTr = "Beyaz Eşya",
      super.mainCategory = MainCategory.electricalJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.paddleBoxBuiltInOvenCookTopDishwasherFranke],
      super.selectedUnitPriceCategory = UnitPriceCategory.paddleBoxBuiltInOvenCookTopDishwasherFranke,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class LandScapeGarden extends Job {
  LandScapeGarden(
    {
      super.nameTr = "Bahçe Yapımı",
      super.mainCategory = MainCategory.landscapeJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.averageGarden],
      super.selectedUnitPriceCategory = UnitPriceCategory.averageGarden,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class OutdoorParkingTile extends Job {
  OutdoorParkingTile(
    {
      super.nameTr = "Açık Otopark Kaplama",
      super.mainCategory = MainCategory.landscapeJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.interlockingPavingStone],
      super.selectedUnitPriceCategory = UnitPriceCategory.interlockingPavingStone,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class CarLift extends Job {
  CarLift(
    {
      super.nameTr = "Araç Asansörü",
      super.mainCategory = MainCategory.landscapeJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.carLift],
      super.selectedUnitPriceCategory = UnitPriceCategory.carLift,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class AutomaticBarrier extends Job {
  AutomaticBarrier(
    {
      super.nameTr = "Garaj Otomatik Bariyer",
      super.mainCategory = MainCategory.landscapeJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.automaticBarrier],
      super.selectedUnitPriceCategory = UnitPriceCategory.automaticBarrier,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class AutomaticShutter extends Job {
  AutomaticShutter(
    {
      super.nameTr = "Garaj Otomatik Kepenk",
      super.mainCategory = MainCategory.landscapeJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.automaticShutter],
      super.selectedUnitPriceCategory = UnitPriceCategory.automaticShutter,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class EnclosingTheLand extends Job {
  EnclosingTheLand(
    {
      super.nameTr = "Mevcut yapının etrafının kapatılması",
      super.mainCategory = MainCategory.generalExpenses,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.trapezoidalSheetCurtain],
      super.selectedUnitPriceCategory = UnitPriceCategory.trapezoidalSheetCurtain,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class MobilizationDemobilization extends Job {
  MobilizationDemobilization(
    {
      super.nameTr = "Mobilizasyon - Demobilizasyon",
      super.mainCategory = MainCategory.generalExpenses,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.mobilizationDemobilization],
      super.selectedUnitPriceCategory = UnitPriceCategory.mobilizationDemobilization,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class Crane extends Job {
  Crane(
    {
      super.nameTr = "Vinç",
      super.mainCategory = MainCategory.generalExpenses,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.crane55Ton],
      super.selectedUnitPriceCategory = UnitPriceCategory.crane55Ton,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class SiteSafety extends Job {
  SiteSafety(
    {
      super.nameTr = "Şantiye güvenlik önlemleri",
      super.mainCategory = MainCategory.generalExpenses,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.siteSafety],
      super.selectedUnitPriceCategory = UnitPriceCategory.siteSafety,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class SiteExpenses extends Job {
  SiteExpenses(
    {
      super.nameTr = "Şantiye Giderleri",
      super.mainCategory = MainCategory.generalExpenses,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.siteExpenses],
      super.selectedUnitPriceCategory = UnitPriceCategory.siteExpenses,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class Sergeant extends Job {
  Sergeant(
    {
      super.nameTr = "Şantiye Çavuşu",
      super.mainCategory = MainCategory.generalExpenses,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.sergeantGrossWage],
      super.selectedUnitPriceCategory = UnitPriceCategory.sergeantGrossWage,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class SiteChief extends Job {
  SiteChief(
    {
      super.nameTr = "Şantiye Şefi",
      super.mainCategory = MainCategory.generalExpenses,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.siteChiefGrossWage],
      super.selectedUnitPriceCategory = UnitPriceCategory.siteChiefGrossWage,
      required super.quantityBuilder,
      super.disable,
    }
  );
}

class ProjectsFeesPayments extends Job {
  ProjectsFeesPayments(
    {
      super.nameTr = "Projelerin çizilmesi, resmi harçlar ve ödemeler",
      super.mainCategory = MainCategory.generalExpenses,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.projectsFeesPayments],
      super.selectedUnitPriceCategory = UnitPriceCategory.projectsFeesPayments,
      required super.quantityBuilder,
      super.disable,
    }
  );
}