import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormfieldCustom extends StatelessWidget {
  const FormfieldCustom({
    Key? key,
    required this.labeltext,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatters,
    this.expand = false,
    this.TextInputAction,
  });

  final String labeltext;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool expand;
  final dynamic TextInputAction;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            maxLines: expand ? null : 1,
            minLines: expand ? 3 : 1,
            keyboardType: keyboardType,
            textInputAction: TextInputAction,
            inputFormatters: inputFormatters,
            obscureText: obscureText,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: labeltext,
              labelStyle: TextStyle(color: Colors.black),
              suffixIcon: suffixIcon,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            validator: validator,
            controller: controller,
          ),
        ));
  }
}
