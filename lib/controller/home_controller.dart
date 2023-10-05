import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parth_kevadiya/model/room_model.dart';

class HomeController extends GetxController {
  final selectedRoom = Rxn<int>();
  RxList<int> roomList = <int>[1, 2, 3, 4, 5].obs;
  RxList<RoomDataModel> roomDataList = <RoomDataModel>[].obs;
  final roomCards = <Container>[].obs;
  final adultCards = <Container>[].obs;
  final childCards = <Container>[].obs;

  RxList<AdultModel> adultList = <AdultModel>[].obs;
  RxList<ChildModel> childList = <ChildModel>[].obs;
  RxBool load = true.obs;
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () => load.value = false);
  }
}
