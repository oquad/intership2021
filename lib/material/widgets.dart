import 'package:flutter/material.dart';

class TitledIcon {
  final String title;
  final IconData icon;
  final Widget Function() builder;

  const TitledIcon(
      {required this.title, required this.icon, required this.builder});
}

class DrawerItem extends StatelessWidget {
  final TitledIcon item;
  final void Function() callback;

  DrawerItem({required this.item, required this.callback, Key? key}) : super(key: key);

  /// TODO define [TextStyle] correctly (including Boldness)
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(item.icon), title: Text(item.title), onTap: callback);
  }
}
