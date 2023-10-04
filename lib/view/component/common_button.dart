import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parth_kevadiya/utils/constant.dart';
import 'package:parth_kevadiya/view/component/common_text.dart';

class CommonButton extends StatelessWidget {
  final String? label;
  final Color? buttonColor;
  final double? height;
  final void Function()? onPressed;
  final double? labelSize;
  final Color? labelColor;
  final FontWeight? labelWeight;
  final double? buttonRadius;
  final String? labelLogo;
  final Color? buttonBorderColor;
  final bool? load;

  const CommonButton(
      {Key? key,
      this.label,
      this.buttonColor,
      this.height,
      this.onPressed,
      this.labelSize,
      this.labelColor,
      this.labelWeight,
      this.buttonRadius,
      this.labelLogo,
      this.buttonBorderColor,
      this.load})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: height,
      minWidth: Get.width,
      onPressed: onPressed,
      padding: const EdgeInsets.all(15),
      color: buttonColor ?? AppColor.primaryColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: buttonBorderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(buttonRadius ?? 8),
      ),
      child: CommonText(
        text: label ?? "",
        fontSize: labelSize ?? 16,
        color: labelColor,
        fontWeight: labelWeight ?? FontWeight.bold,
        textAlign: TextAlign.center,
      ),
    );
  }
}
