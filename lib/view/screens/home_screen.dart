import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:parth_kevadiya/controller/home_controller.dart';
import 'package:parth_kevadiya/model/room_model.dart';
import 'package:parth_kevadiya/utils/constant.dart';
import 'package:parth_kevadiya/view/component/common_button.dart';
import 'package:parth_kevadiya/view/component/common_text.dart';
import 'package:parth_kevadiya/view/component/common_textField.dart';
import 'package:parth_kevadiya/view/screens/result_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeController = Get.put<HomeController>(HomeController());
  final formKey = GlobalKey<FormBuilderState>();
  final adultList = <TextEditingController>[];
  final childList = <TextEditingController>[];
  final adultNameList = <TextEditingController>[];
  final adultAgeList = <TextEditingController>[];
  final childNameList = <TextEditingController>[];
  final childAgeList = <TextEditingController>[];

  Container createCard(int index) {
    final adultCon = TextEditingController();
    final childCon = TextEditingController();
    adultList.add(adultCon);
    childList.add(childCon);
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.15),
            blurRadius: 3,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(text: "Room ${(index + 1)}"),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: CommonTextField(
                  con: adultCon,
                  hintText: "Adult",
                  keyBoardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                flex: 2,
                child: CommonTextField(
                  con: childCon,
                  hintText: "Child",
                  keyBoardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                flex: 1,
                child: CommonButton(
                  label: "ADD",
                  onPressed: () {
                    for (int i = 0; i < int.parse(adultCon.text); i++) {
                      homeController.adultCards.add(createAdultCard(i));
                      homeController.adultList.add(AdultModel(roomId: index.toString()));
                    }
                    for (int i = 0; i < int.parse(childCon.text); i++) {
                      homeController.childCards.add(createChildCard(i));
                      homeController.childList.add(ChildModel(roomId: index.toString()));
                    }
                  },
                  labelColor: AppColor.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container createAdultCard(int index) {
    final nameCon = TextEditingController();
    final ageCon = TextEditingController();
    adultNameList.add(nameCon);
    adultAgeList.add(ageCon);
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.15),
            blurRadius: 3,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CommonText(text: "Adult"),
          Row(
            children: [
              Expanded(
                child: CommonTextField(
                  con: nameCon,
                  hintText: "Name",
                  keyBoardType: TextInputType.text,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: CommonTextField(
                  con: ageCon,
                  hintText: "Age",
                  keyBoardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container createChildCard(int index) {
    final nameCon = TextEditingController();
    final ageCon = TextEditingController();
    childNameList.add(nameCon);
    childAgeList.add(ageCon);
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.15),
            blurRadius: 3,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CommonText(text: "Child"),
          Row(
            children: [
              Expanded(
                child: CommonTextField(
                  con: nameCon,
                  hintText: "Name",
                  keyBoardType: TextInputType.text,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: CommonTextField(
                  con: ageCon,
                  hintText: "Age",
                  keyBoardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                FormBuilderDropdown<int>(
                  name: 'Room',
                  decoration: const InputDecoration(
                    hintText: 'Select Room',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  onChanged: (v) {
                    homeController.roomDataList.clear();
                    homeController.roomCards.clear();
                    homeController.adultCards.clear();
                    homeController.childCards.clear();
                    homeController.selectedRoom.value = v;
                    if (homeController.selectedRoom.value != null) {
                      for (int i = 0; i < homeController.selectedRoom.value!; i++) {
                        homeController.roomCards.add(createCard(i));
                      }
                    }
                  },
                  items: homeController.roomList
                      .map((e) => DropdownMenuItem(
                            alignment: AlignmentDirectional.centerStart,
                            value: e,
                            child: CommonText(text: e.toString()),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => Column(
                    children: List.generate(
                      homeController.roomCards.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            homeController.roomCards[index],
                            Column(
                              children: List.generate(
                                homeController.adultCards.length,
                                (i) => int.tryParse(homeController.adultList[i].roomId ?? "0") == index
                                    ? homeController.adultCards[i]
                                    : const SizedBox(),
                              ),
                            ),
                            Column(
                              children: List.generate(
                                homeController.childCards.length,
                                (j) => int.tryParse(homeController.childList[j].roomId ?? "0") == index
                                    ? homeController.childCards[j]
                                    : const SizedBox(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                CommonButton(
                  label: "Submit",
                  labelColor: AppColor.white,
                  onPressed: () {
                    List<AdultModel> tempAdultList = [];
                    List<ChildModel> tempChildList = [];
                    int j = 0;
                    homeController.roomDataList.clear();
                    if (homeController.selectedRoom.value != null) {
                      for (int i = 0; i < homeController.selectedRoom.value!; i++) {
                        for (j; j < homeController.roomCards.length; j++) {
                          String adult = adultList[j].text;
                          String child = childList[j].text;
                          if (homeController.adultCards.isNotEmpty) {
                            for (int i = 0; i < homeController.adultCards.length; i++) {
                              String adultName = adultNameList[i].text;
                              String adultAge = adultAgeList[i].text;
                              tempAdultList.add(AdultModel(name: adultName, age: adultAge, roomId: "${j + 1}"));
                            }
                          }
                          if (homeController.childCards.isNotEmpty) {
                            for (int i = 0; i < homeController.childCards.length; i++) {
                              String childName = childNameList[i].text;
                              String childAge = childAgeList[i].text;
                              tempChildList.add(ChildModel(name: childName, age: childAge));
                            }
                          }

                          homeController.roomDataList.add(
                            RoomDataModel(
                              adultCount: adult,
                              childCount: child,
                              roomName: "Room ${j + 1}",
                              adultList: tempAdultList,
                              childList: tempChildList,
                            ),
                          );
                        }
                      }
                    }
                    // print(homeController.roomDataList);
                    Get.to(() => ResultScreen());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
