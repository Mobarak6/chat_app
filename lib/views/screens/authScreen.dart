// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Auth Screen'),
        ),
        body: Center(
          child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.google),
              label: const Text('Google SignIn')),
        ),
      ),
    );
  }
}
