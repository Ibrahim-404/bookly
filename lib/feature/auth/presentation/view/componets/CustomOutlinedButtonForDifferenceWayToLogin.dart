import 'package:bookly/core/utils/constraint/appStyle.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButtonForDifferenceWayToLogin extends StatelessWidget {
  final String imagePath,hintText;
  CustomOutlinedButtonForDifferenceWayToLogin({super.key, required this.imagePath, required this.hintText});
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          minimumSize: Size(double.infinity, 46),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                style: BorderStyle.solid,
              )),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
              image: AssetImage(imagePath),
              height: 23,
              width: 23,
            ),
            Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                hintText,
                style: AppStyle.rgular14,
              ),
            ),
            Spacer(
              flex: 2,
            )
          ],
        ));
  }

}