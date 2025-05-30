import 'dart:async';

import 'package:my_growth/view/getstart.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Getstart()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 0, 121, 63),
            Color.fromARGB(255, 216, 235, 154)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Center(
            child: Image.asset(
              'assets/MYGL.png',
              width: 350,
              height: 350,
            ),
          ),
        ),
      ),
    );
  }
}