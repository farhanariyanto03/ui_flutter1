import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/images/background.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 42
              ),
            Image.asset('assets/images/Logo-pet.png', height: 22),
            ],
        ))
      ]),
    );
  }
}
