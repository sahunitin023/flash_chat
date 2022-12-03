// ignore_for_file: library_private_types_in_public_api, avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/components/constants.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String exEmail;
  late String exPassword;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: SizedBox(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            Text(
              'Login',
              textAlign: TextAlign.center,
              style: GoogleFonts.rammettoOne(
                textStyle: const TextStyle(
                  fontSize: 30.0,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                exEmail = value;
              },
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your email',
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                exPassword = value;
              },
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter the Password',
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            IntroButton(
              onPress: () async {
                try {
                  await _auth.signInWithEmailAndPassword(
                      email: exEmail, password: exPassword);
                  Navigator.pushNamed(context, ChatScreen.id);
                } catch (e) {
                  print(e);
                }
              },
              bgColor: Colors.lightBlueAccent,
              title: "Log in",
            ),
          ],
        ),
      ),
    );
  }
}
