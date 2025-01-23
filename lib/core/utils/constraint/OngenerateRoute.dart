import 'package:bookly/feature/home/presentation/view/screen/BookDetails.dart';
import 'package:bookly/feature/search/presentaion/view/screen/search%20screen.dart';
import 'package:bookly/feature/splash/presentation/view/screen/Splash.dart';
import 'package:flutter/material.dart';
import 'package:bookly/feature/home/presentation/view/screen/home.dart';

class ManagerRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Splash());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      case '/bookDetails':
        return MaterialPageRoute(builder: (_) =>Bookdetails());
      case '/search':
        return MaterialPageRoute(builder: (_) => Search());
      default:
        return MaterialPageRoute(builder: (_) => Splash());
    }
  }
}