import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onBackButtonPressed;

  CustomAppBar({required this.title, this.onBackButtonPressed});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
        ),
        onPressed: onBackButtonPressed,
      ),
    );
  }
}
