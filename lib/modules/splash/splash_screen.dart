import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mega_store/modules/SignIn/sign_in_screen.dart';
import 'package:mega_store/shared/assets_manager.dart';
import 'package:mega_store/shared/responsive.dart';
import 'package:mega_store/shared/shared_method.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      navigatTo(context, screen: const SignInScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: SizedBox(
        height: rheight(context),
        width: rwidth(context),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: rwidth(context) / 15),
            child: Image(
              image: const AssetImage(ImgAsset.logo),
              height: rheight(context) / 2,
              width: rwidth(context),
            ),
          ),
        ),
      ),
    );
  }
}
