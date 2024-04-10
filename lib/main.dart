import 'package:bookly/core/constraint/assetsColorCont.dart';
import 'package:bookly/routes/routesValue.dart';
import 'package:bookly/feature/splash/presentation/view/screen/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Bookly());
}

class Bookly extends StatelessWidget {
  Bookly({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return MaterialApp(
      home: const SplahScreen(),
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor:AssetsColorConst.mainColor,
      ),
      darkTheme:ThemeData.dark().copyWith(),
      onGenerateRoute: (settings) => RoutesViewModel.genterateRoute(settings),
      debugShowCheckedModeBanner: false,
    );
  }
}
