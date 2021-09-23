import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup/screens/HomeScreen.dart';
import 'package:signup/screens/SignupScreen.dart';
import 'package:signup/services/UserService.dart';
import 'package:signup/theme/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserService(),
        ),
      ],
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: defaultTheme,
          home: SignupScreen(),
          routes: {
            HomeScreen.routeName: (context) => HomeScreen(),
          },
        ),
      ),
    );
  }
}
