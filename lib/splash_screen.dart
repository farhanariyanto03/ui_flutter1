import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });

    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/images/background.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Center(
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 42),
              Image.asset('assets/images/Logo-pet.png', height: 22),
              const SizedBox(height: 73),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "Helping you\nto keep",
                      style: GoogleFonts.manrope(
                          fontSize: 24,
                          color: Color(0xFFDEE1FE),
                          letterSpacing: 3.5 / 100,
                          height: 152 / 100),
                      children: const [
                        TextSpan(
                            text: "your bestie ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800)),
                        TextSpan(text: "\nstay healthy!")
                      ]))
            ],
          )),
        )
      ]),
    );
  }
}
