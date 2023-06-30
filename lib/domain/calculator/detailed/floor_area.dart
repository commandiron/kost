import 'package:kost/domain/calculator/detailed/room.dart';

abstract class FloorArea {
  final List<Room> rooms;

  FloorArea(
    {
      required this.rooms
    }
  );
}

class Apartment extends FloorArea {
  Apartment({required super.rooms});
}

class CommonArea extends FloorArea {
  CommonArea({required super.rooms});
}