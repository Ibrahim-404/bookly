import 'package:flutter/material.dart';

Widget buildElevatedButtonForAuthFunction({
  required String hintText,
  GlobalKey<FormState>? GetformKey,
  required Function()? function, // Ensure function is required
}) {
  return ElevatedButton(
    onPressed: () {
      if (GetformKey != null && GetformKey.currentState!.validate()) {
        function?.call(); // Ensure the function is executed properly
      } else {
        print("Not valid!.. Enter valid data");
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFFEF8262),
      minimumSize: Size(double.infinity, 46),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    child: Text(
      hintText,
      style: TextStyle(color: Colors.white),
    ),
  );
}
