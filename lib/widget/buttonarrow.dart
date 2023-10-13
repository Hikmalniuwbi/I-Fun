import 'package:flutter/material.dart';

class Buttonarrow extends StatefulWidget {
  const Buttonarrow({super.key});

  @override
  State<Buttonarrow> createState() => _ButtonarrowState();
}

class _ButtonarrowState extends State<Buttonarrow> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ));
  }
}
