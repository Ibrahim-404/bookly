import 'package:bookly/feature/home/data/model/list_of_book_home_model.dart';
import 'package:bookly/feature/home/presentation/view/screen/BookDetails.dart';
import 'package:bookly/feature/search/presentaion/view/screen/search%20screen.dart';
import 'package:bookly/feature/splash/presentation/view/screen/Splash.dart';
import 'package:flutter/material.dart';
import 'package:bookly/feature/home/presentation/view/screen/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManagerRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Splash());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      case '/bookDetails':
          Item? book ;
        return MaterialPageRoute(builder: (_) =>BookDetails(
       fetchItems:book,
        ));
      case '/search':
        return MaterialPageRoute(builder: (_) => Search());
      default:
        return MaterialPageRoute(builder: (_) => Splash());
    }
  }
}