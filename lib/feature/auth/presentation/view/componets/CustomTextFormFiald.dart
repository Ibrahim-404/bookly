import 'package:flutter/material.dart';

class CustomTextFormFiald extends StatelessWidget {
  final String textHint;
  final IconData icon;
  TextEditingController? controller;
  final TextInputType? type;

  CustomTextFormFiald(
      {super.key,
      required this.textHint,
      required this.icon,
      this.type,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller,
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return "Enter $textHint";
      //   } else if (textHint == "Email") {
      //     return "Enter Valid Email";
      //   }else if(textHint == "password"){
      //     return "Enter Valid Password";
      //   }
      // },
      keyboardType: type,
      style: TextStyle(fontFamily: 'PlayfairDisplay'),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0XFFEBF0FF), width: 1),
        ),
        suffixIcon:textHint == "password" ?Icon(Icons.visibility_off_outlined):null,
        prefixIcon: Icon(icon),
        hintText: textHint,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0XFFEBF0FF), width: 1),
        ),
      ),
    );
  }
}
