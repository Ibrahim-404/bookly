import 'package:bookly/core/utils/constraint/appStyle.dart';
import 'package:flutter/material.dart';

Row QuestionAndNavigation({required String Question,required String wheretoNavigate, BuildContext? context,void Function()? onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        Question ,
        style: AppStyle.rgular14,
      ),
      InkWell(
        onTap: onTap,
        child: Text(
          wheretoNavigate,
          style: AppStyle.rgular14.copyWith(color: Color(0xFFEF8262)),
        ),
      ),
    ],
  );
}