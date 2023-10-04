import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parth_kevadiya/utils/constant.dart';
import 'package:parth_kevadiya/view/screens/home_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(
    GetMaterialApp(
      theme: ThemeData(primaryColor: AppColor.primaryColor),
      home: HomeScreen(),
    ),
  );
}
