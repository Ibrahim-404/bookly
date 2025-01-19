import 'package:bookly/core/utils/constraint/appStyle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Best_Seller extends StatelessWidget {
  final String imageLink, bookName, authorName, price, rate, viewing;

  Best_Seller({
    super.key,
    required this.imageLink,
    required this.bookName,
    required this.authorName,
    required this.price,
    required this.rate,
    required this.viewing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imageLink,
          width: 71,
          height: 113.5,
        ),
        const SizedBox(
          width: 27.5,
        ),
        Expanded( // Wrap the Column in an Expanded widget
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero, // Remove default padding
                title: Text(
                  maxLines: 2,
                  bookName,
                  style: AppStyle.rgular20.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                subtitle: Text(
                  authorName,
                  style:AppStyle.rgular14,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero, // Remove default padding
                title: Text(
                  "$price \$", // Corrected to show price
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min, // Use min size for trailing
                  children: [
                    Icon(
                      FontAwesomeIcons.star,
                      color: Colors.yellow,
                    ),
                    SizedBox(width: 5),
                    Text(
                      rate,
                      style: AppStyle.rgular16,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "($viewing)",
                      style: AppStyle.rgular14,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}