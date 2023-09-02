import 'room.dart';

abstract class FloorSection {
  final List<Room> rooms;

  FloorSection(
    {required this.rooms}
  );
}

class CommonArea extends FloorSection {
  CommonArea({required super.rooms});
}

class Apartment extends FloorSection {
  Apartment({required super.rooms});
}