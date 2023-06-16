abstract class QuantityCalculator {
  double quantity;
  QuantityCalculator(
    {
      this.quantity = 0,
    }
  );
}

class ShoringQuantityCalculator extends QuantityCalculator {
  ShoringQuantityCalculator._(
    {
      super.quantity
    }
  );

  factory ShoringQuantityCalculator(
    {
      double shoringLength = 0,
      double shoringHeight = 0
    }
  ) {
    return ShoringQuantityCalculator._(quantity: shoringLength * shoringHeight);
  }
}
