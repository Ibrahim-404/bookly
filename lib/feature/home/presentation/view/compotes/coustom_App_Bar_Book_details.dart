import 'package:flutter/material.dart';

class CustomAppBarBookDetails extends StatelessWidget {
  const CustomAppBarBookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: Icon(Icons.close, size: 22),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      trailing:
          InkWell(onTap: () {}, child: Icon(Icons.shopping_cart_outlined)),
    );
    ;
  }
}
