import 'package:equatable/equatable.dart';

import '../../floor_viewer/domain/model/floor/floor.dart';

class EditFloorState extends Equatable {
  final Floor floor;

  const EditFloorState({
    required this.floor,
  });

  EditFloorState copyWith({
    Floor? floor,
  }) {
    return EditFloorState(
        floor: floor ?? this.floor
    );
  }

  @override
  List<Object?> get props => [
    floor
  ];
}