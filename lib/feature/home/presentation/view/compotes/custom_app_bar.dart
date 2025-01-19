import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppbarApplication extends StatelessWidget {
  const AppbarApplication({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset("assets/picture_file/LogoForAppBar.png"),
      trailing:
      InkWell(onTap: () {}, child: Icon(FontAwesomeIcons.magnifyingGlass)),
    );
  }
}