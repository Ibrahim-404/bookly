import 'package:bookly/core/service_locator.dart';
import 'package:bookly/core/utils/constraint/OngenerateRoute.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main(){
  ServiceLocator().setup_serviceLocator();
  runApp(
      Bookly()
  );  
}
class Bookly extends StatelessWidget {
   Bookly({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookly',
    theme:ThemeData.dark().copyWith(
      // useMaterial3: true,
      splashColor: Color(0xFF1E1E1E),
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Color(0xFF100B20),
      textTheme: GoogleFonts.montserratSubrayadaTextTheme(ThemeData.dark().textTheme),

    ),
onGenerateRoute: ManagerRoute.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
