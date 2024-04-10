import 'package:bookly/routes/routesNamed.dart';
import 'package:bookly/feature/home/presentation/view/screen/home.dart';
import 'package:bookly/feature/splash/presentation/view/screen/splashScreen.dart';
import 'package:flutter/material.dart';

class RoutesViewModel {
  RoutesViewModel();
  static Route<dynamic>? genterateRoute(RouteSettings settings){
    switch (settings.name) {
      case  ConstantRouter.splash:{
        return  MaterialPageRoute(builder: (context) => const SplahScreen());
      }
      case ConstantRouter.home:{
        return MaterialPageRoute(builder: (context)=> const Home());
      }
      default:{
        return MaterialPageRoute(builder: (context) => const SplahScreen());
      }
    }
  }
}
