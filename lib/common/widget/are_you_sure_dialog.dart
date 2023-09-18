import 'package:flutter/material.dart';

class ApproveDialog extends StatelessWidget {
  const ApproveDialog(
      {super.key, required this.title, this.onCancelPressed, this.onDeclinePressed, this.onApprovePressed,});

  final String title;
  final void Function()? onCancelPressed;
  final void Function()? onDeclinePressed;
  final void Function()? onApprovePressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(title),
      actions: [
        if(onCancelPressed != null)
          ElevatedButton(
            onPressed: onCancelPressed,
            child: const Text("İptal"),
          ),
        if(onDeclinePressed != null)
          ElevatedButton(
            onPressed: onDeclinePressed,
            child: const Text("Hayır"),
          ),
        if(onApprovePressed != null)
          ElevatedButton(
            onPressed: onApprovePressed,
            child: const Text("Evet"),
          )
      ],
    );
  }
}

Future<bool?> showApproveDialog(BuildContext context, {String title = ""}) {
  return showDialog<bool?>(
    context: context,
    builder: (_) {
      return ApproveDialog(
        title: title,
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

Future<bool?> showCancelableApproveDialog(BuildContext context, {String title = ""}) {
  return showDialog<bool?>(
    context: context,
    builder: (_) {
      return ApproveDialog(
        title: title,
        onCancelPressed: () {
          Navigator.of(context).pop();
        },
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