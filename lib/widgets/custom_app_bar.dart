import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  final List<Widget>? actions;

  const CustomAppbar({Key? key, required this.title, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AppBar(
      elevation: 0,
      toolbarHeight: 56,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      leadingWidth: 0,
      title: Text(title),
      titleSpacing: 0,
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 56);
}
