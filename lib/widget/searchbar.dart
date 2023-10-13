import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Searchbarcostum extends StatelessWidget {
  const Searchbarcostum({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            labelStyle: TextStyle(color: Colors.black),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: 25,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(20)),
            hintText: "Search"),
      ),
    );
  }
}
