import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup/components/AppDrawer.dart';
import 'package:signup/components/BaseAppBar.dart';
import 'package:signup/services/UserService.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  static final routeName = '/home';
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      drawer: AppDrawer(),
      body: SafeArea(
        child: Center(
          child: Consumer<UserService>(
            builder: (context, userService, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Seja bem-vindo, ${userService.currentUser?.fullName}!",
                  ),
                  SizedBox(height: 10),
                  Text(
                    "E-mail: ${userService.currentUser?.email}",
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Data de nascimento: ${DateFormat.yMMMMd('pt_BR').format(DateTime.parse(userService.currentUser?.birthdate))}",
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Senha: ${userService.currentUser?.password}",
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
