class RoomModel {
  List<RoomModel>? roomList;

  RoomModel({this.roomList});
}

class RoomDataModel {
  String? roomName;
  String? adultCount;
  String? childCount;
  List<AdultModel>? adultList;
  List<ChildModel>? childList;

  RoomDataModel({this.roomName, this.adultCount, this.childCount, this.adultList, this.childList});
}

class AdultModel {
  String? roomId;
  String? name;
  String? age;

  AdultModel({this.roomId, this.name, this.age});
}

class ChildModel {
  String? roomId;
  String? name;
  String? age;

  ChildModel({this.roomId, this.name, this.age});
}
