import 'package:bookly/feature/splash/presentation/view/components/SplashScreenContaint.dart';
import 'package:bookly/routes/routesNamed.dart';
import 'package:flutter/material.dart';
class SplahScreen extends StatefulWidget {
  const SplahScreen({super.key});

  @override
  State<SplahScreen> createState() => _SplahScreenState();
}

class _SplahScreenState extends State<SplahScreen> {
  @override
  void initState() {
    super.initState();
    navigatorToHome();
  }

  void navigatorToHome() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, ConstantRouter.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreenContaint(),
    );
  }
}
