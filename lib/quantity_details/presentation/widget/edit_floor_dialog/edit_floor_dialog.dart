import 'package:flutter/material.dart';
import 'package:kost/common/config/app_padding.dart';
import 'package:kost/common/config/app_text_style.dart';
import 'package:kost/common/extension/formatted_number.dart';

import '../../../domain/model/floor/floor.dart';
import 'floor_attr_check_box.dart';
import 'floor_attr_text_field.dart';

class EditFloorDialog extends StatefulWidget {
  const EditFloorDialog(
      {super.key,
      required this.floor,
      this.onDeleteFloor,
      required this.onSubmit});

  final Floor floor;
  final void Function()? onDeleteFloor;
  final void Function(Floor? submittedFloor) onSubmit;

  @override
  State<EditFloorDialog> createState() => _EditFloorDialogState();
}

class _EditFloorDialogState extends State<EditFloorDialog> {
  bool _isAnyChange = false;
  late Floor _submittedFloor;

  @override
  void initState() {
    _submittedFloor = widget.floor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: AppPadding.zero!,
      contentPadding: AppPadding.zero!,
      title: Container(
          color: Theme.of(context).colorScheme.primary,
          padding: AppPadding.allS!,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${widget.floor.floorName} Detayları",
                style: AppTextStyle.responsiveH4(context)
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
              if (widget.onDeleteFloor != null)
                InkWell(
                  onTap: widget.onDeleteFloor,
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      minRadius: 16,
                      child: Icon(
                        Icons.delete,
                        color: Theme.of(context).colorScheme.error,
                        size: 20,
                      )),
                )
            ],
          )),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "İptal",
              style: AppTextStyle.responsiveH5(context),
            )),
        ElevatedButton(
            onPressed: () {
              if(_isAnyChange) {
                widget.onSubmit(_submittedFloor);
              } else {
                widget.onSubmit(null);
              }
            },
            child: Text(
              "Onayla",
              style: AppTextStyle.responsiveH5(context),
            ))
      ],
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloorAttrTextField(
              title: "Alan:",
              formattedQuantity: widget.floor.area.toFormattedText(),
              symbol: "m²",
              onChanged: (String value) {
                _isAnyChange = true;
                _submittedFloor = _submittedFloor.copyWith(area: value.toNumber());
              },
            ),
            FloorAttrTextField(
              title: "Çevre Uzunluğu:",
              formattedQuantity: widget.floor.perimeter.toFormattedText(),
              symbol: "m",
              onChanged: (String value) {
                _isAnyChange = true;
                _submittedFloor = _submittedFloor.copyWith(perimeter: value.toNumber());
              },
            ),
            FloorAttrTextField(
                title: "Döşeme Dahil Yükseklik:",
                formattedQuantity:
                    widget.floor.heightWithSlab.toFormattedText(),
                symbol: "m",
                onChanged: (String value) {
                  _isAnyChange = true;
                  _submittedFloor = _submittedFloor.copyWith(heightWithSlab: value.toNumber());
                }),
            FloorAttrTextField(
                title: "Döşeme kalınlığı:",
                formattedQuantity: widget.floor.slabHeight.toFormattedText(),
                symbol: "m",
                onChanged: (String value) {
                  _isAnyChange = true;
                  _submittedFloor = _submittedFloor.copyWith(slabHeight: value.toNumber());
                }),
            FloorAttrCheckBox(
              title: "Döşeme tipi Asmolen:",
              value: widget.floor.isCeilingSlabHollow,
              onChanged: (value) {
                _isAnyChange = true;
                _submittedFloor = _submittedFloor.copyWith(isSlabHollow: value);
              },
            ),
            FloorAttrTextField(
                title: "Kalın Duvar Uzunluğu:",
                formattedQuantity:
                    widget.floor.thickWallLength.toFormattedText(),
                symbol: "m",
                onChanged: (String value) {
                  _isAnyChange = true;
                  _submittedFloor = _submittedFloor.copyWith(thickWallLength: value.toNumber());
                }),
            FloorAttrTextField(
                title: "İnce Duvar Uzunluğu:",
                formattedQuantity:
                    widget.floor.thinWallLength.toFormattedText(),
                symbol: "m",
                onChanged: (String value) {
                  _isAnyChange = true;
                  _submittedFloor = _submittedFloor.copyWith(thinWallLength: value.toNumber());
                }),
          ],
        ),
      ),
    );
  }
}
