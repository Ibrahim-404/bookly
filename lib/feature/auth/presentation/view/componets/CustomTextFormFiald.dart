import 'package:flutter/material.dart';

class CustomTextFormFiald extends StatelessWidget {
  final String textHint;
  final IconData icon;
  final TextInputType? type;
  CustomTextFormFiald({
    super.key, required this.textHint, required this.icon, this.type,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter $textHint";
        }else if(textHint == "Email"){
          return "Enter Valid Email";
        }
      },
      keyboardType: type,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0XFFEBF0FF), width: 1),
        ),
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