import 'package:flutter/material.dart';
import 'package:kost/logic/cost_item/cost_item.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final iksa = Iksa(
      quantity: 1000,
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
              Text(iksa.unitPrice.toString()),
              Text(iksa.currency.symbol),
              Text("/"),
              Text(iksa.unit.symbol),
              SizedBox(width: 16,),
              Text(iksa.quantity.toString()),
              Text(iksa.unit.symbol),
              SizedBox(width: 16,),
              Text(iksa.totalPriceTRY.toString()),
              Text("TL"),
            ],
          )
        ),
      )
    );
  }
}