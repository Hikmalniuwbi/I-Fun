import 'package:flutter/material.dart';

class DropdownFormFieldCustom extends StatelessWidget {
  const DropdownFormFieldCustom({
    Key? key,
    required this.items,
    this.onChanged,
    this.validator,
    this.value,
    this.labelText,
  });

  final List<DropdownMenuItem<dynamic>>? items;
  final void Function(dynamic)? onChanged;
  final String? Function(dynamic)? validator;
  final dynamic value;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: DropdownButtonFormField(
          value: value,
          items: items,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            labelText: labelText,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            labelStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
