import 'package:flutter/material.dart';

class AreYouSureDialog extends StatelessWidget {
  const AreYouSureDialog(
      {super.key, required this.frontTitle, this.onDeclinePressed, this.onApprovePressed,});

  final String frontTitle;
  final void Function()? onDeclinePressed;
  final void Function()? onApprovePressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        frontTitle.isEmpty 
        ? "Emin misiniz?"
        : "$frontTitle emin misiniz?"
      ),
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

Future<bool?> showAreYouSureDialog(BuildContext context, {String frontTitle = ""}) {
  return showDialog<bool?>(
    context: context,
    builder: (_) {
      return AreYouSureDialog(
        frontTitle: frontTitle,
        onDeclinePressed: () {
          Navigator.of(context).pop(false);
        },
        onApprovePressed: () {
          Navigator.of(context).pop(true);
        },
      );
    },
  );
}
