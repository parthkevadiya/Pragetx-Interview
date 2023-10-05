import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parth_kevadiya/controller/home_controller.dart';
import 'package:parth_kevadiya/utils/constant.dart';
import 'package:parth_kevadiya/view/component/common_text.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key});
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemCount: homeController.roomCards.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [BoxShadow(color: AppColor.black.withOpacity(0.15), blurRadius: 3, spreadRadius: 3)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(text: homeController.roomDataList[index].roomName),
                CommonText(text: "Adult : ${homeController.roomDataList[index].adultCount}"),
                CommonText(text: "Child : ${homeController.roomDataList[index].childCount}"),

                ///Below Code is Not perfect working
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      homeController.roomDataList[index].adultList?.length ?? 0,
                      (i) => int.parse(homeController.roomDataList[index].adultList?[i].roomId ?? "0") ==
                              int.parse(homeController.roomDataList[index].roomName?.split(" ").last ?? "0")
                          ? Container(
                              width: Get.width,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(color: AppColor.black.withOpacity(0.15), blurRadius: 3, spreadRadius: 3)
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CommonText(text: "Adult"),
                                  CommonText(text: homeController.roomDataList[index].adultList?[i].name),
                                  CommonText(text: homeController.roomDataList[index].adultList?[i].age),
                                ],
                              ),
                            )
                          : SizedBox(),
                    )),
                Column(
                    children: List.generate(
                  homeController.roomDataList[index].childList?.length ?? 0,
                  (i) => int.parse(homeController.roomDataList[index].childList?[i].roomId ?? "0") ==
                          int.parse(homeController.roomDataList[index].roomName?.split(" ").last ?? "0")
                      ? Container(
                          width: Get.width,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(color: AppColor.black.withOpacity(0.15), blurRadius: 3, spreadRadius: 3)
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CommonText(text: "Child"),
                              CommonText(text: homeController.roomDataList[index].childList?[i].name),
                              CommonText(text: homeController.roomDataList[index].childList?[i].age),
                            ],
                          ),
                        )
                      : SizedBox(),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
