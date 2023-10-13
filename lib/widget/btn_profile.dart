import 'package:flutter/material.dart';

class Buttonprofile extends StatefulWidget {
  const Buttonprofile({super.key});

  @override
  State<Buttonprofile> createState() => _ButtonprofileState();
}

class _ButtonprofileState extends State<Buttonprofile> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/profilepage');
        },
        icon: Icon(
          Icons.person_outlined,
          color: Colors.white,
        ));
  }
}
