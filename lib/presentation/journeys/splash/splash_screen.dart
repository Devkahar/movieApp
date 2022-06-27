

import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/size_extension.dart';

import '../../../common/constants/route_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    print("Splash Screen");
    Future.delayed(const Duration(seconds: 1))
    .then((value) => {
      // Write Logic for Eighter We Should redirect to Login or Home Screen.
      Navigator.of(context).pushNamed(RouteList.home_screen)
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: Sizes.dimen_300.w.toDouble(),
            child: Image.asset('assets/pngs/logo.png',fit: BoxFit.contain,)
        ),
      ),
    );
  }
}
