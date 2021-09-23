import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup/screens/ProfileScreen.dart';
import 'package:signup/screens/SignupScreen.dart';
import 'package:signup/services/UserService.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserService>(
      builder: (context, userService, child) {
        return Drawer(
          child: Column(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: Text("${userService.currentUser?.getInitials()}"),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      title: Text("Meu perfil"),
                      onTap: () {
                        Navigator.of(context).popAndPushNamed(
                          ProfileScreen.routeName,
                        );
                      },
                      leading: Icon(
                        Icons.person_outline,
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("Termos de uso"),
                      onTap: () {},
                      leading: Icon(
                        Icons.notes_outlined,
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("Logout"),
                      onTap: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          SignupScreen.routeName,
                          (route) => false,
                        );
                        userService.removeCurrentUser();
                      },
                      leading: Icon(
                        Icons.logout,
                      ),
                    ),
                    Divider(),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
