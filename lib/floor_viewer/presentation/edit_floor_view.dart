import 'package:flutter/material.dart';
import 'package:kost/floor_viewer/domain/model/floor/floor.dart';

class EditFloorView extends StatelessWidget {
  const EditFloorView({Key? key, required this.floor}) : super(key: key);

  final Floor floor;

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
