import 'package:flutter/material.dart';
import 'package:kost/common/config/app_padding.dart';
import 'package:kost/common/config/app_text_style.dart';
import 'package:kost/common/extension/formatted_number.dart';

import '../../../domain/model/calculator/floor.dart';
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

  final _formKey = GlobalKey<FormState>();
  Floor? _submittedFloor;

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
                    onTap: widget.onDeleteFloor,
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
              widget.onSubmit(_submittedFloor);
            },
            child: Text(
              "Onayla",
              style: AppTextStyle.responsiveH5(context),
            ))
      ],
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloorAttrTextField(
                title: "Alan:",
                formattedQuantity: widget.floor.area.toFormattedText(),
                symbol: "m²",
                onChanged: (String value) {
                  if(_formKey.currentState!.validate()) {
                    _submittedFloor = widget.floor.copyWith(area: value.toNumber());
                  }
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
                title: "Tavan Döşeme tipi Asmolen:",
                value: widget.floor.isCeilingHollowSlab,
                onChanged: (value) {
                  _submittedFloor =
                      widget.floor.copyWith(isCeilingHollowSlab: value);
                },
              ),
              //Aşağıdan devam et
              SizedBox(
                height: 300,
                width: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.floor.windows.length,
                  itemBuilder: (context, index) {
                    final window = widget.floor.windows[index];
                    return Column(
                      children: [
                        Text("Pencere ${index + 1}"),
                        Text("Uzunluk: ${window.width.toString()}"),
                        Text("Yükseklik: ${window.height.toString()}"),
                        Text("Adet: ${window.count}"),
                        Row(
                          children: [
                            const Text("Korkuluk: "),
                            Checkbox(
                              value: window.hasRailing,
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Denizlik: "),
                            Checkbox(
                              value: window.hasWindowsill,
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
