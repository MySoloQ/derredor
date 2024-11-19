// ignore_for_file: file_names

import 'dart:async';

import 'package:derredor/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  // ignore: unused_field
  late Animation<double> _reverseAnimation;

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
    );

    _reverseAnimation = ReverseAnimation(_animation);

    Timer(const Duration(seconds: 4), (){
      _controller.reverse().then((_){
        Navigator.of(context).pushReplacementNamed('initialPage');
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleApp.detailsLago2,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Image.asset(
            'assets/icons/icon_sol_tocantins.png',
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}
