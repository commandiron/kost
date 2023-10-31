import 'package:kost/apartment_details/domain/model/floor/room/apartment_room.dart';
import 'package:kost/apartment_details/domain/model/floor/room/common_area_room.dart';

import 'room/room.dart';

abstract class FloorSection {
  final String nameTr;
  List<Room> rooms;

  FloorSection(
    {
      required this.nameTr,
      this.rooms = const [],
    }
  );
}

class CommonArea extends FloorSection {
  final List<CommonAreaRoom> commonAreaRooms;
  CommonArea({super.nameTr = "Ortak Alan",  required this.commonAreaRooms}){
    super.rooms = commonAreaRooms;
  }
}

class Apartment extends FloorSection {
  final List<ApartmentRoom> apartmentAreaRooms;
  Apartment({super.nameTr = "Daire", required this.apartmentAreaRooms}){
    super.rooms = apartmentAreaRooms;
  }
}