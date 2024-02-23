import 'package:flutter/material.dart';
import 'package:honey_morning_mobile/screens/signup_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const SignUpScreen(), routes: {});
  }
}
