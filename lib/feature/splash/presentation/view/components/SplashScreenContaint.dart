import 'package:bookly/core/constraint/assetsImageConst.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class SplashScreenContaint extends StatefulWidget {
  const SplashScreenContaint({super.key});

  @override
  State<SplashScreenContaint> createState() => _SplashScreenContaintState();
}

class _SplashScreenContaintState extends State<SplashScreenContaint>
    with SingleTickerProviderStateMixin {
  late Animation<AlignmentGeometry> _alimaentAnimation;
  late AnimationController _TextController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createAnimation();
  }
void createAnimation(){
  _TextController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);
  _alimaentAnimation = AlignmentTween(
      begin:Alignment.bottomCenter, end: Alignment.topCenter)
      .animate(
      CurvedAnimation(parent: _TextController, curve: Curves.decelerate));
  _TextController.forward();
}
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _TextController.dispose();
  }

  Widget _AnimationText() {
    return AlignTransition(alignment: _alimaentAnimation, child: FreeBook());
  }

  Widget FreeBook() {
    return const Text(
      "Read Free Book",
      style: TextStyle(fontSize: 15, color: Colors.white70),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Image.asset(
            assetsImagesConst.logo,
          ),
          const SizedBox(height: 4),
          Expanded(child: _AnimationText()),
        ],
      ),
    );
  }
}
