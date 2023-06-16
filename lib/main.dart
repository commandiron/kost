import 'package:flutter/material.dart';
import 'package:kost/logic/cost_item/cost_item.dart';

import 'logic/cost_item/price.dart';
import 'logic/quantity_calculator.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final iksa = Iksa(
      unitPrice: Price(amount: 1540, unit: Unit.squareMeters),
      quantityCalculator: ShoringQuantityCalculator(
        shoringLength: 120,
        shoringHeight: 5
      ),
    );
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Row(
            children: [
              Text(iksa.name),
              SizedBox(width: 16,),
              Text(iksa.explanation),
              SizedBox(width: 16,),
              Text(iksa.unitPrice!.amount.toString()),
              Text(iksa.unitPrice!.currency.symbol),
              Text("/"),
              Text(iksa.unitPrice!.unit.symbol),
              SizedBox(width: 16,),
              Text(iksa.quantityCalculator!.quantity.toString()),
              SizedBox(width: 16,),
              Text(iksa.totalPriceLira.amount.toString()),
              Text(iksa.totalPriceLira.currency.symbol),
              SizedBox(width: 16,),
            ],
          )
        ),
      )
    );
  }
}