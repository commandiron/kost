import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/config/app_space.dart';
import 'package:kost/config/app_text_style.dart';

import '../../../domain/bloc/cost_table_bloc.dart';
import '../../../domain/bloc/cost_table_event.dart';
import '../../../domain/model/cost/category.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({Key? key, required this.costCategory}) : super(key: key);
  final CostCategory costCategory;
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
                  Text(costCategory.jobCategory.nameTr, style: AppTextStyle.b1!.copyWith(color: Theme.of(context).colorScheme.primary),),
                  AppSpace.vS!,
                  Text("pozunu silmek istediğinize emin misiniz?", style: AppTextStyle.b1!,),
                ],
              ),
              actions: [
                ElevatedButton(onPressed: () => Navigator.of(context).pop(false), child: const Text("Hayır")),
                ElevatedButton(onPressed: () => Navigator.of(context).pop(true), child: const Text("Evet")),
              ],
            );
          },
        );
        await Future.delayed(const Duration(milliseconds: 150)); //Dialog close transition duration.
        if(result != null && result) {
          if(context.mounted) {
            context.read<CostTableBloc>().add(DeleteCostCategory(costCategory));
          }
        }
      },
      icon: Icon(Icons.close, color: Theme.of(context).colorScheme.error,)
    );
  }
}