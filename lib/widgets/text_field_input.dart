// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:heritagekunja_app/utils/colors.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  const TextFieldInput(
      {Key? key,
      required this.textEditingController,
      this.isPass = false,
      required this.hintText,
      required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
        borderSide: Divider.createBorderSide(
      context,
    ));
    return TextField(
      controller: textEditingController,
      style: TextStyle(
        fontSize: 16,
        color: lightGreyColor,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lightGreyColor,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lightGreyColor,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(8.0),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
