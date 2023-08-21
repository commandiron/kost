import 'package:flutter/material.dart';

class AreYouSureDialog extends StatelessWidget {
  const AreYouSureDialog({super.key, this.onDeclinePressed, this.onApprovePressed});

  final void Function()? onDeclinePressed;
  final void Function()? onApprovePressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text("Emin misiniz?"),
      actions: [
        ElevatedButton(
          onPressed: onDeclinePressed,
          child: Text("Hayır"),
        ),
        ElevatedButton(
          onPressed: onApprovePressed,
          child: Text("Evet"),
        )
      ],
    );
  }
}
