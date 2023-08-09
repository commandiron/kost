import 'package:kost/domain/model/unit_price/unit.dart';
import 'currency.dart';

class UnitPrice {
  UnitPriceCategory category;
  String nameTr;
  double amount;
  double fixedAmount;
  Currency currency;
  DateTime dateTime;
  Unit unit;

  UnitPrice(
    {
      required this.category,
      required this.nameTr,
      required this.amount,
      this.fixedAmount = 0,
      required this.currency,
      required this.dateTime,
      required this.unit,
    }
  );
}

enum UnitPriceCategory {
  shutCrete,
  excavation,
  breaker,
  foundationStabilizationGravel,
  c16Concrete,
  plywood,
  c30Concrete,
  c35Concrete,
  c40Concrete,
  s420Steel,
  eps14Dns,
  proofBitumenMembrane,
  bitumenSliding,
  cementSliding,
  drainPlate,
  aeratedConcreteYtong,
  aeratedConcreteLabor,
  steelConstructionBraasRoof,
  steelScaffolding,
  windowJoineryRehau,
  wroughtIronRailing,
  aluminumRailing,
  sinterFlexFacade,
  precastFacade,
  plaster,
  painting,
  cementBasedFlexInsulation,
  drywall,
  covingPlaster,
  screed300Doses,
  marbleFloorBilecik,
  marbleStepBilecik,
  marbleWindowsillBilecik,
  ceramicTileVitraVersus,
  laminatedSerifoglu,
  steelDoorKale,
  entranceDoor,
  ironFireDoor,
  lacqueredDoorArtella,
  shinyLacqueredKitchenCupboardAster,
  matteLacqueredKitchenCupboardAster,
  quartzCountertopCimstone,
  lacqueredCabinet,
  lacqueredFloorPlinth,
  mechanicalInfrastructure,
  airConditionerArcelik,
  vrfMultiSplitMitshubishiElectric,
  ventilation,
  galvanize25TonWaterTankEsinoks,
  elevation10PersonKone,
  elevation6PersonKone,
  sinkVitra,
  sinkBatteryVitra,
  concealedCisternVitra,
  showerHuppe100x100,
  showerBatteryVitra,
  kitchenFaucetAndSinkFranke,
  electricalInfrastructure,
  generatorAksa160,
  paddleBoxBuiltInOvenCookTopDishwasherFranke,
  averageGarden,
  interlockingPavingStone,
  carLift,
  automaticBarrier,
  trapezoidalSheetCurtain,
  mobilizationDemobilization,
  crane15Ton,
  siteSafety,
  siteExpenses,
  sergeantGrossWage,
  projectManagerGrossWage,
  projectsFeesPayments;
}