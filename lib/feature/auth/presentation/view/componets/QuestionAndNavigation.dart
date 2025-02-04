import 'package:bookly/core/utils/constraint/appStyle.dart';
import 'package:flutter/material.dart';

Row QuestionAndNavigation({required String Question,required String wheretoNavigate,required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        Question ,
        style: AppStyle.rgular14,
      ),
      InkWell(
        onTap: () {
          // Handle the tap event here
          print("Register tapped");
          // You can navigate to the registration page or show a dialog
          // Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
        },
        child: Text(
          wheretoNavigate,
          style: AppStyle.rgular14.copyWith(color: Color(0xFFEF8262)),
        ),
      ),
    ],
  );
}