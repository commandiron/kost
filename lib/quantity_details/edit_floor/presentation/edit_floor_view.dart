import 'package:flutter/material.dart';

class EditFloorView extends StatelessWidget {
  const EditFloorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text("Floor name"),
          ],
        ),
      ),
    );
  }
}
