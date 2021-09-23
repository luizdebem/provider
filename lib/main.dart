import 'package:flutter/material.dart';
import 'package:signup/screens/SignupScreen.dart';
import 'package:signup/theme/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: defaultTheme,
        home: SignupScreen(),
      ),
    );
  }
}
