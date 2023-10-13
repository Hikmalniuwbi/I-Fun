import 'package:flutter/material.dart ';

class Custombutton extends StatelessWidget {
  const Custombutton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.onTap,
    required this.onPressed,
  });

  final String text;
  // final Element style;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final Function()? onTap;

  // Custombutton({
  //   required this.text,
  //   required this.backgroundColor,
  //   required this.textColor,
  //   required this.onPressed,
  // });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: 300,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              // ignore: deprecated_member_use
              primary: backgroundColor,
              elevation: 6),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
