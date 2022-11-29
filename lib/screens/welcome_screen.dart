// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                Hero(
                  tag: 'title',
                  child: Text(
                    'Flash Chat',
                    style: GoogleFonts.rammettoOne(
                      textStyle: const TextStyle(
                        fontSize: 35.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'login_screen');
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: const Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'registration_screen');
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: const Text(
                    'Register',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
