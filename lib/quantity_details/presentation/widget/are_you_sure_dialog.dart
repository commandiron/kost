import 'package:flutter/material.dart';

class AreYouSureDeleteDialog extends StatelessWidget {
  const AreYouSureDeleteDialog(
      {super.key, this.onDeclinePressed, this.onApprovePressed});

  final void Function()? onDeclinePressed;
  final void Function()? onApprovePressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text("Silmek istediğinize emin misiniz?"),
      actions: [
        ElevatedButton(
          onPressed: onDeclinePressed,
          child: const Text("Hayır"),
        ),
        ElevatedButton(
          onPressed: onApprovePressed,
          child: const Text("Evet"),
        )
      ],
    );
  }
}
