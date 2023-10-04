import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parth_kevadiya/utils/constant.dart';

class CommonTextField extends StatelessWidget {
  final String? hintText;
  final String? headerLabel;
  final EdgeInsetsGeometry? contentPadding;
  final Color? hintTextColor;
  final FontWeight? hintTextFontWeight;
  final double? hintTextFontSize;
  final String? Function(String?)? validator;
  final TextInputType? keyBoardType;
  final TextEditingController? con;
  final bool? readOnly;
  final void Function()? onTap;
  void Function(String)? onChanged;
  final int? maxLine;
  final List<TextInputFormatter>? inputFormatters;
  CommonTextField({
    Key? key,
    this.hintText,
    this.headerLabel,
    this.contentPadding,
    this.hintTextColor,
    this.hintTextFontWeight,
    this.hintTextFontSize,
    this.keyBoardType,
    this.onChanged,
    this.con,
    this.validator,
    this.readOnly,
    this.onTap,
    this.inputFormatters,
    this.maxLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: con,
      keyboardType: keyBoardType,
      validator: validator,
      readOnly: readOnly ?? false,
      onTap: onTap,
      onChanged: onChanged,
      enabled: true,
      inputFormatters: inputFormatters,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 15),
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: TextStyle(
            color: hintTextColor ?? AppColor.grey,
            fontWeight: hintTextFontWeight ?? FontWeight.w400,
            fontSize: hintTextFontSize ?? 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
