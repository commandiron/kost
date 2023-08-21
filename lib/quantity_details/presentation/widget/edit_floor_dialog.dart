import 'package:flutter/material.dart';
import 'package:kost/common/config/app_padding.dart';
import 'package:kost/common/config/app_space.dart';
import 'package:kost/common/config/app_text_style.dart';
import 'package:kost/common/extension/formatted_number.dart';
import 'package:kost/common/widget/quantity_text_field.dart';

import '../../domain/model/calculator/floor.dart';

class EditFloorDialog extends StatelessWidget {
  const EditFloorDialog(
      {super.key,
      required this.floor,
      required this.onFloorDelete,
      required this.onFloorAreaChanged});

  final Floor floor;
  final void Function() onFloorDelete;
  final void Function(String floorAreaText, int no) onFloorAreaChanged;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: AppPadding.zero!,
      contentPadding: AppPadding.zero!,
      title: Container(
          color: Theme.of(context).colorScheme.primary,
          padding: AppPadding.vS!.add(AppPadding.hM!),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${floor.floorName} Detayları",
                style: AppTextStyle.responsiveH3(context)
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: onFloorDelete,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.delete, color: Theme.of(context).colorScheme.error,)
                    ),
                  ),
                ],
              )
            ],
          )),
      actions: [
        ElevatedButton(
            onPressed: onFloorDelete,
            child: Text(
              "Sil",
              style: AppTextStyle.responsiveH5(context),
            )),
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
              //Validate form
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
                formattedQuantity: floor.area.toFormattedText(),
                symbol: "m²"),
            FloorAttrTextField(
                title: "Çevre Uzunluğu:",
                formattedQuantity: floor.perimeter.toFormattedText(),
                symbol: "m"),
            FloorAttrTextField(
                title: "Döşeme Hariç Yükseklik:",
                formattedQuantity: floor.heightWithoutSlab.toFormattedText(),
                symbol: "m"),
            FloorAttrTextField(
                title: "Tavan Alanı:",
                formattedQuantity: floor.ceilingArea.toFormattedText(),
                symbol: "m²"),
            FloorAttrTextField(
                title: "Tavan Çevre Uzunluğu:",
                formattedQuantity: floor.ceilingPerimeter.toFormattedText(),
                symbol: "m"),
            FloorAttrTextField(
                title: "Toplam Kat Yüksekliği:",
                formattedQuantity: floor.fullHeight.toFormattedText(),
                symbol: "m"),
            FloorAttrTextField(
                title: "Kalın Duvar Uzunluğu:",
                formattedQuantity: floor.thickWallLength.toFormattedText(),
                symbol: "m"),
            FloorAttrTextField(
                title: "İnce Duvar Uzunluğu:",
                formattedQuantity: floor.thinWallLength.toFormattedText(),
                symbol: "m"),
            FloorAttrCheckBox(
                title: "Döşeme tipi Asmolen", value: floor.isCeilingHollowSlab),
            SizedBox(
              height: 300,
              width: 400,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: floor.windows.length,
                itemBuilder: (context, index) {
                  final window = floor.windows[index];
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
  const FloorAttrTextField(
      {super.key,
      required this.title,
      required this.formattedQuantity,
      required this.symbol});

  final String title;
  final String formattedQuantity;
  final String symbol;

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
