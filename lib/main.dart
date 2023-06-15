import 'package:flutter/material.dart';
import 'package:kost/logic/project.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    final costItem = CostItem(
      name: "İksa Yapılması",
      explanation: "Shutcreate",
      unitPrice: Price(
        amount: 1540,
        unit: Unit.squareMeters
      ),
      quantity: 100
    );

    return MaterialApp(
      home: Container(
        alignment: Alignment.center,
        child: Text(costItem.totalPriceLira.amount.toString()),
      )
    );
  }
}