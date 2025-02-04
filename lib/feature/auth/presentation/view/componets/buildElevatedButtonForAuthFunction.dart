import 'package:flutter/material.dart';

ElevatedButton buildElevatedButtonForAuthFunction({required String hintText,required GlobalKey<FormState> GetformKey}) {

  return ElevatedButton(
      onPressed: () {
        if (GetformKey.currentState!.validate()) {
          print("valid");
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFEF8262),
        minimumSize: Size(double.infinity, 46),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        hintText,
        style: TextStyle(color: Colors.white),
      ));
}