import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/apartment_details/domain/bloc/apartment_details_bloc.dart';
import 'package:kost/apartment_details/domain/model/floor/floor.dart';
import 'package:kost/common/config/app_text_style.dart';

import '../../../common/widget/are_you_sure_dialog.dart';
import '../../domain/bloc/apartment_details_event.dart';

class EditFloorView extends StatelessWidget {
  const EditFloorView({Key? key, required this.floor}) : super(key: key);

  final Floor floor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${floor.floorName} Detayları",
          style: AppTextStyle.responsiveH4(context).copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final result = await showAreYouSureDialog(
                context,
                frontTitle: "Silmek istediğinize",
              ) ?? false;
              if (context.mounted) {
                if (result) {
                  context.read<ApartmentDetailsBloc>().add(DeleteFloor(floor));
                  Navigator.of(context).pop();
                }
              }
            },
            icon: const Icon(
              Icons.delete,
            ),
          ),
        ],
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
