import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  const BaseAppBar({
    Key key,
    this.height = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Estudando Provider'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
