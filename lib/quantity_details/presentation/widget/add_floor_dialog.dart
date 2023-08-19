import 'package:flutter/material.dart';

class AddFloorDialog extends StatelessWidget {
  const AddFloorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Kat Ekle"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(),
          TextFormField(),
        ],
      ),
    );
  }
}
