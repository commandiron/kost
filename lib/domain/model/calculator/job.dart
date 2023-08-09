import 'package:uuid/uuid.dart';

import '../unit_price/unit_price.dart';

abstract class Job {
  Job({
    required this.nameTr,
    required this.mainCategory,
    required this.enabledUnitPriceCategories,
    required this.selectedUnitPriceCategory,
    this.selectedUnitPriceId,
    required this.quantity,
    required this.quantityExplanation
  });
  String id = const Uuid().v4();
  final String nameTr;
  final MainCategory mainCategory;
  List<UnitPriceCategory> enabledUnitPriceCategories;
  UnitPriceCategory selectedUnitPriceCategory;
  String? selectedUnitPriceId;
  double quantity;
  String quantityExplanation;
}

class Shoring extends Job {
  Shoring(
    {
      super.nameTr = "İksa Yapılması",
      super.mainCategory = MainCategory.excavationJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.shutCrete],
      super.selectedUnitPriceCategory = UnitPriceCategory.shutCrete,
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
    }
  );
}

class SubFoundationConcrete extends Job {
  SubFoundationConcrete(
    {
      super.nameTr = "Temel altı grobeton ve yalıtım koruma betonu atılması",
      super.mainCategory = MainCategory.roughConstructionJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.c16Concrete],
      super.selectedUnitPriceCategory = UnitPriceCategory.c16Concrete,
      required super.quantity,
      required super.quantityExplanation,
    }
  );
}

class ConcreteFormWork extends Job {
  ConcreteFormWork(
    {
      super.nameTr = "Temel altı grobeton ve yalıtım koruma betonu atılması",
      super.mainCategory = MainCategory.roughConstructionJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.plywood],
      super.selectedUnitPriceCategory = UnitPriceCategory.plywood,
      required super.quantity,
      required super.quantityExplanation,
    }
  );
}

class PouringConcrete extends Job {
  PouringConcrete(
    {
      super.nameTr = "Plywood ile düz yüzeyli beton ve betonarme kalıbı yapılması (Düz Ölçü)",
      super.mainCategory = MainCategory.roughConstructionJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.c30Concrete, UnitPriceCategory.c35Concrete, UnitPriceCategory.c40Concrete],
      super.selectedUnitPriceCategory = UnitPriceCategory.c35Concrete,
      required super.quantity,
      required super.quantityExplanation,
    }
  );
}

class Rebar extends Job {
  Rebar(
    {
      super.nameTr = "Ø8-32 mm çapında betonarme çeliği temini ve döşenmesi",
      super.mainCategory = MainCategory.roughConstructionJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.s420Steel],
      super.selectedUnitPriceCategory = UnitPriceCategory.s420Steel,
      required super.quantity,
      required super.quantityExplanation,
    }
  );
}

class HollowFloorFilling extends Job {
  HollowFloorFilling(
    {
      super.nameTr = "Asmolen döşeme dolgusunun yapılması",
      super.mainCategory = MainCategory.roughConstructionJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.eps14Dns],
      super.selectedUnitPriceCategory = UnitPriceCategory.eps14Dns,
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
    }
  );
}

class WallMaterial extends Job {
  WallMaterial(
    {
      super.nameTr = "Duvar malzeme",
      super.mainCategory = MainCategory.roughConstructionJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.aeratedConcreteYtong],
      super.selectedUnitPriceCategory = UnitPriceCategory.aeratedConcreteYtong,
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
    }
  );
}

class FacadeSystem extends Job {
  FacadeSystem(
    {
      super.nameTr = "Cephe kaplama sisteminin yapılması",
      super.mainCategory = MainCategory.facadeJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.sinterFlexFacade, UnitPriceCategory.precastFacade],
      super.selectedUnitPriceCategory = UnitPriceCategory.sinterFlexFacade,
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
    }
  );
}

class AirConditioner extends Job {
  AirConditioner(
    {
      super.nameTr = "Mekanik Altyapı İşleri",
      super.mainCategory = MainCategory.mechanicalJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.airConditionerArcelik, UnitPriceCategory.vrfMultiSplitMitshubishiElectric],
      super.selectedUnitPriceCategory = UnitPriceCategory.airConditionerArcelik,
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
    }
  );
}

class Elevation extends Job {
  Elevation(
    {
      super.nameTr = "Asansör",
      super.mainCategory = MainCategory.mechanicalJobs,
      super.enabledUnitPriceCategories = const [UnitPriceCategory.elevation10PersonKone],
      super.selectedUnitPriceCategory = UnitPriceCategory.elevation10PersonKone,
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
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
      required super.quantity,
      required super.quantityExplanation,
    }
  );
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
  String get nameTr {
    return switch (this) {
    MainCategory.excavationJobs => "Hafriyat İşleri",
    MainCategory.roughConstructionJobs => "Kaba Yapı İşleri",
    MainCategory.roofJobs => "Çatı İşleri",
    MainCategory.facadeJobs => "Cephe İşleri",
    MainCategory.interiorJobs => "İç İmalatlar",
    MainCategory.mechanicalJobs => "Mekanik Tesisat",
    MainCategory.electricalJobs => "Elektrik Tesisat ",
    MainCategory.landscapeJobs => "Peysaj İşleri",
    MainCategory.generalExpenses => "Genel Giderler"
  };
  }
}

// enum JobCategory {


//   landScapeGarden([UnitPriceCategory.averageGarden,]),
//   outdoorParkingTile([UnitPriceCategory.interlockingPavingStone]),
//   carLift([UnitPriceCategory.carLift]),
//   automaticBarrier([UnitPriceCategory.automaticBarrier]),

//   enclosingTheLand([UnitPriceCategory.trapezoidalSheetCurtain]),
//   mobilizationDemobilization([UnitPriceCategory.mobilizationDemobilization]),
//   crane([UnitPriceCategory.crane15Ton]),
//   siteSafety([UnitPriceCategory.siteSafety]),
//   siteExpenses([UnitPriceCategory.siteExpenses]),
//   sergeant([UnitPriceCategory.sergeantGrossWage]),
//   projectManager([UnitPriceCategory.projectManagerGrossWage]),
//   projectsFeesPayments([UnitPriceCategory.projectsFeesPayments]);
//
//   const JobCategory(
//     this.unitPriceCategories,
//     {this.quantity = 0}
//   );
//   final List<UnitPriceCategory> unitPriceCategories;
//   final double quantity;
// }

// extension JobCategoryExtension on JobCategory {
//   String get nameTr {
//     return switch (this) {
//       JobCategory.landScapeGarden => "Bahçe Yapımı",
//       JobCategory.outdoorParkingTile => "Açık Otopark Kaplama",
//       JobCategory.carLift => "Araç Asansörü",
//       JobCategory.automaticBarrier => "Garaj Otomatik Bariyer",

//       JobCategory.enclosingTheLand => "Mevcut yapının etrafının kapatılması",
//       JobCategory.mobilizationDemobilization => "Mobilizasyon - Demobilizasyon",
//       JobCategory.crane => "Vinç",
//       JobCategory.siteSafety => "Şantiye güvenlik önlemleri",
//       JobCategory.siteExpenses => "Şantiye Giderleri",
//       JobCategory.sergeant => "Şantiye Çavuşu",
//       JobCategory.projectManager => "Proje Müdürü",
//       JobCategory.projectsFeesPayments => "Projelerin çizilmesi, resmi harçlar ve ödemeler",
//     };
//   }
// }