import 'package:flutter/material.dart';
import 'package:kost/common/config/app_padding.dart';
import 'package:kost/common/config/app_text_style.dart';
import 'package:kost/common/extension/formatted_number.dart';
import 'package:kost/common/widget/quantity_text_field.dart';

import '../../domain/model/calculator/floor.dart';

class EditFloorDialog extends StatefulWidget {
  const EditFloorDialog(
      {super.key,
      required this.floor,
      required this.onFloorDelete,
      required this.onFloorApproved});

  final Floor floor;
  final void Function() onFloorDelete;
  final void Function(Floor floor) onFloorApproved;

  @override
  State<EditFloorDialog> createState() => _EditFloorDialogState();
}

class _EditFloorDialogState extends State<EditFloorDialog> {
  Floor? _edittedFloor;

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
              Row(
                children: [
                  InkWell(
                    onTap: widget.onFloorDelete,
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        minRadius: 16,
                        child: Icon(
                          Icons.delete,
                          color: Theme.of(context).colorScheme.error,
                          size: 20,
                        )),
                  ),
                ],
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
              if (_edittedFloor != null) {
                widget.onFloorApproved(_edittedFloor!);
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
                _edittedFloor = widget.floor.copyWith(area: value.toNumber());
              },
            ),
            FloorAttrTextField(
                title: "Çevre Uzunluğu:",
                formattedQuantity: widget.floor.perimeter.toFormattedText(),
                symbol: "m"),
            FloorAttrTextField(
                title: "Döşeme Hariç Yükseklik:",
                formattedQuantity:
                    widget.floor.heightWithoutSlab.toFormattedText(),
                symbol: "m"),
            FloorAttrTextField(
                title: "Tavan Alanı:",
                formattedQuantity: widget.floor.ceilingArea.toFormattedText(),
                symbol: "m²"),
            FloorAttrTextField(
                title: "Tavan Çevre Uzunluğu:",
                formattedQuantity:
                    widget.floor.ceilingPerimeter.toFormattedText(),
                symbol: "m"),
            FloorAttrTextField(
                title: "Toplam Kat Yüksekliği:",
                formattedQuantity: widget.floor.fullHeight.toFormattedText(),
                symbol: "m"),
            FloorAttrTextField(
                title: "Kalın Duvar Uzunluğu:",
                formattedQuantity:
                    widget.floor.thickWallLength.toFormattedText(),
                symbol: "m"),
            FloorAttrTextField(
                title: "İnce Duvar Uzunluğu:",
                formattedQuantity:
                    widget.floor.thinWallLength.toFormattedText(),
                symbol: "m"),
            FloorAttrCheckBox(
                title: "Döşeme tipi Asmolen",
                value: widget.floor.isCeilingHollowSlab),
            //Aşağıdan devam et
            SizedBox(
              height: 300,
              width: 400,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.floor.windows.length,
                itemBuilder: (context, index) {
                  final window = widget.floor.windows[index];
                  return Text(window.width.toString());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FloorAttrTextField extends StatelessWidget {
  const FloorAttrTextField({
    super.key,
    required this.title,
    required this.formattedQuantity,
    required this.symbol,
    this.onChanged,
  });

  final String title;
  final String formattedQuantity;
  final String symbol;
  final Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.hM!.add(AppPadding.vS!),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: Text(
            title,
            style: AppTextStyle.responsiveH5(context),
          )),
          Expanded(
            flex: 2,
            child: QuantityTextField(
              formattedQuantity: formattedQuantity,
              symbol: symbol,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

class FloorAttrCheckBox extends StatelessWidget {
  const FloorAttrCheckBox(
      {super.key, required this.title, required this.value});

  final String title;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.hM!.add(AppPadding.vS!),
      child: Row(
        children: [
          Expanded(
            child: Text(title, style: AppTextStyle.responsiveH5(context)),
          ),
          Expanded(
            flex: 2,
            child: Checkbox(
              value: value,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
