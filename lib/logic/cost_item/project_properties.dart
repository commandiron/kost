import 'cost_item.dart';

class RoughConstructionCalculator {

  final double shoreLength;
  final double shoreHeight;

  RoughConstructionCalculator(
    {
      required this.shoreLength,
      required this.shoreHeight,
    }
  );

  void calculateCost() {
    final iksaCost = Iksa(
      quantity: shoreLength * shoreHeight
    ).totalPriceTRY;
  }
}