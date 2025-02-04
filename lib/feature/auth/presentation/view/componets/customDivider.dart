import 'package:bookly/core/utils/constraint/appStyle.dart';
import 'package:flutter/material.dart';

Row customDivider() {
  return Row(
    children: [
      Expanded(
        child: Divider(
          thickness: 1,
          color: Colors.grey,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Text(
          "or",
          style: AppStyle.rgular14,
        ),
      ),
      Expanded(
        child: Divider(
          thickness: 1,
          color: Colors.grey,
        ),
      ),
    ],
  );
}