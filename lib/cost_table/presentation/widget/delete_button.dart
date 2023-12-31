import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/common/config/app_space.dart';
import 'package:kost/common/config/app_text_style.dart';

import '../../domain/bloc/cost_table_bloc.dart';
import '../../domain/bloc/cost_table_event.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({Key? key, required this.name, required this.jobId}) : super(key: key);
  final String name;
  final String jobId;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final result = await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: AppTextStyle.b1.copyWith(color: Theme.of(context).colorScheme.primary),),
                  AppSpace.vS!,
                  Text("pozunu silmek istediğinize emin misiniz?", style: AppTextStyle.b1,),
                ],
              ),
              actions: [
                ElevatedButton(onPressed: () => Navigator.of(context).pop(false), child: const Text("Hayır")),
                ElevatedButton(onPressed: () => Navigator.of(context).pop(true), child: const Text("Evet")),
              ],
            );
          },
        );
        if(result != null && result) {
          if(context.mounted) {
            context.read<CostTableBloc>().add(DeleteJob(jobId));
          }
        }
      },
      icon: Icon(Icons.close, color: Theme.of(context).colorScheme.error,)
    );
  }
}