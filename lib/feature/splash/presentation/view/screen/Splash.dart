import 'package:bookly/core/utils/Function/save_userId.dart';
import 'package:bookly/core/utils/constraint/picture.dart';
import 'package:bookly/core/utils/constraint/routes_name.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late Animation<Offset> animation;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    slidingAnimation();
    Future.delayed(const Duration(seconds: 4), () async {
      String? userId = await SaveUserId().getUserId();
      if (userId == null) {
        Navigator.pushNamed(context, RoutesName.signIn);
      } else {
        Navigator.pushNamed(context, RoutesName.home);
      }
    });
  }

  void slidingAnimation() {
     controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 3))
      ..forward();
    animation = Tween<Offset>(
      begin: const Offset(-2, 3),
      end: Offset.zero,
    ).chain(CurveTween(curve: Curves.elasticInOut)).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Picture.AppLogo),
            Center(
              child: SlideTransition(
                position:animation ,
                child: const Text(
                  "Read book for free",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),

    );
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
