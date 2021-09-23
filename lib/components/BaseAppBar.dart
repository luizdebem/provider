import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final List<Widget> actions;
  const BaseAppBar({
    Key key,
    this.height = 50.0,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Estudando Provider'),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
