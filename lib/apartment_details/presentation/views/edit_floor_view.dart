import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/apartment_details/domain/bloc/apartment_details_bloc.dart';
import 'package:kost/apartment_details/domain/model/floor/floor.dart';
import 'package:kost/common/config/app_text_style.dart';
import 'package:kost/common/extension/formatted_number.dart';

import '../../../common/config/app_padding.dart';
import '../../../common/widget/are_you_sure_dialog.dart';
import '../../domain/bloc/apartment_details_event.dart';
import '../../domain/model/floor/floor_section.dart';
import '../widget/edit_floor_dialog/edit_floor_sub_title.dart';
import '../widget/edit_floor_dialog/floor_attr_check_box.dart';
import '../widget/edit_floor_dialog/floor_attr_text_field.dart';

class EditFloorView extends StatefulWidget {
  const EditFloorView({Key? key, required this.floor}) : super(key: key);

  final Floor floor;

  @override
  State<EditFloorView> createState() => _EditFloorViewState();
}

class _EditFloorViewState extends State<EditFloorView> {

  bool _isAnyChange = false;
  late Floor _editedFloor;

  @override
  void initState() {
    _editedFloor = widget.floor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.floor is InitialFloor ? "Yeni Kat Ekle (${widget.floor.floorName})" : "${widget.floor.floorName} Detayları",
          style: AppTextStyle.responsiveH4(context).copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        centerTitle: true,
        leading: BackButton(
          onPressed: () async {
            if(!_isAnyChange) {
              Navigator.pop(context);
            } else {
              final result = await showApproveDialog(
                context,
                title: "Değişiklikleri kaydetmediniz! Geri dönmek istediğinize emin misiniz?",
              ) ?? false;
              if (context.mounted) {
                if (result) {
                  Navigator.pop(context);
                }
              }
            }
          },
        ),
        actions: [
          if(widget.floor is! InitialFloor)
            IconButton(
              onPressed: () async {
                final result = await showApproveDialog(
                  context,
                  title: "Silmek istediğinize emin misiniz?",
                ) ?? false;
                if (context.mounted) {
                  if (result) {
                    context.read<ApartmentDetailsBloc>().add(DeleteFloor(widget.floor));
                    Navigator.pop(context);
                  }
                }
              },
              icon: const Icon(
                Icons.delete,
              ),
            ),
          if(widget.floor is! InitialFloor)
            IconButton(
              onPressed: () async {
                final result = await showApproveDialog(
                  context,
                  title: "Değişiklikleri kaydetmek istediğinize emin misiniz?",
                ) ?? false;
                if (context.mounted) {
                  if (result) {
                    if(_isAnyChange) {
                      context.read<ApartmentDetailsBloc>().add(EditFloor(_editedFloor));
                    } else {
                      context.read<ApartmentDetailsBloc>().add(const EditFloor(null));
                    }
                    Navigator.pop(context);
                  }
                }
              },
              icon: const Icon(
                Icons.save,
              ),
            ),
          if(widget.floor is InitialFloor)
            IconButton(
              onPressed: () async {
                final result = await showApproveDialog(
                  context,
                  title: "Eklemek istediğinize emin misiniz?",
                ) ?? false;
                if (context.mounted) {
                  if (result) {
                    if(_isAnyChange) {
                      context.read<ApartmentDetailsBloc>().add(AddFloor(_editedFloor));
                    } else {
                      context.read<ApartmentDetailsBloc>().add(const AddFloor(null));
                    }
                    Navigator.pop(context);
                  }
                }
              },
              icon: const Icon(
                Icons.add,
              ),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloorAttrTextField(
              title: "Alan:",
              formattedQuantity: widget.floor.area.toFormattedText(),
              symbol: "m²",
              onChanged: (String value) {
                _isAnyChange = true;
                _editedFloor = _editedFloor.copyWith(area: value.toNumber());
              },
            ),
            FloorAttrTextField(
              title: "Çevre Uzunluğu:",
              formattedQuantity: widget.floor.perimeter.toFormattedText(),
              symbol: "m",
              onChanged: (String value) {
                _isAnyChange = true;
                _editedFloor = _editedFloor.copyWith(perimeter: value.toNumber());
              },
            ),
            FloorAttrTextField(
                title: "Döşeme Dahil Yükseklik:",
                formattedQuantity: widget.floor.heightWithSlab.toFormattedText(),
                symbol: "m",
                onChanged: (String value) {
                  _isAnyChange = true;
                  _editedFloor = _editedFloor.copyWith(heightWithSlab: value.toNumber());
                }),
            FloorAttrTextField(
                title: "Döşeme kalınlığı:",
                formattedQuantity: widget.floor.slabHeight.toFormattedText(),
                symbol: "m",
                onChanged: (String value) {
                  _isAnyChange = true;
                  _editedFloor = _editedFloor.copyWith(slabHeight: value.toNumber());
                }),
            FloorAttrCheckBox(
              title: "Tavan Döşeme tipi Asmolen:",
              value: widget.floor.isCeilingSlabHollow,
              onChanged: (value) {
                _isAnyChange = true;
                _editedFloor = _editedFloor.copyWith(isCeilingSlabHollow: value);
              },
            ),
            FloorAttrTextField(
                title: "Kalın Duvar Uzunluğu:",
                formattedQuantity: widget.floor.thickWallLength.toFormattedText(),
                symbol: "m",
                onChanged: (String value) {
                  _isAnyChange = true;
                  _editedFloor = _editedFloor.copyWith(thickWallLength: value.toNumber());
                }),
            FloorAttrTextField(
                title: "İnce Duvar Uzunluğu:",
                formattedQuantity: widget.floor.thinWallLength.toFormattedText(),
                symbol: "m",
                onChanged: (String value) {
                  _isAnyChange = true;
                  _editedFloor = _editedFloor.copyWith(thinWallLength: value.toNumber());
                }),
            SectionViewer(floorSections: widget.floor.sections),
          ],
        ),
      ),
    );
  }
}

class SectionViewer extends StatelessWidget {
  const SectionViewer({Key? key, required this.floorSections}) : super(key: key);

  final List<FloorSection> floorSections;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const EditFloorSubTitle(text: "Kat Bölümleri"),
        SizedBox(
          width: 600,
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: floorSections.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  if(index == 0)
                    AspectRatio(
                      aspectRatio: 1,
                      child: Padding(
                        padding: AppPadding.allS!,
                        child: Container(
                          width: 100,
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            child: IconButton(onPressed: () {

                            }, icon: const Icon(Icons.add)),
                          ),
                        ),
                      ),
                    ),
                  AspectRatio(
                    aspectRatio: 1,
                    child: Padding(
                      padding: AppPadding.allS!,
                      child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: const BorderRadius.all(
                              Radius.circular(16)
                          ),
                        ),
                        child: Text(
                          floorSections[index].nameTr,
                          style: AppTextStyle.b2.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}