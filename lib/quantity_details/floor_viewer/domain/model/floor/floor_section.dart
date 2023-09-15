import 'room/room.dart';

abstract class FloorSection {
  final String nameTr;
  final List<Room> rooms;

  FloorSection(

    {required this.nameTr, required this.rooms}
  );
}

class CommonArea extends FloorSection {
  CommonArea({super.nameTr = "Ortak Alan", required super.rooms});
}

class Apartment extends FloorSection {
  Apartment({super.nameTr = "Daire", required super.rooms});
}