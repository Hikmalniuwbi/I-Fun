// import 'package:flutter/material.dart';

// class MyTextfield extends StatefulWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final Icon? icon;
//   final bool obscureText;
//   final String? Function(String?)? validator;

//   MyTextfield({
//     Key? key,
//     required this.controller,
//     required this.hintText,
//     this.icon,
//     required this.obscureText,
//     this.validator,
//   }) : super(key: key);

//   @override
//   _MyTextfieldState createState() => _MyTextfieldState();
// }

// class _MyTextfieldState extends State<MyTextfield> {
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 25),
//         child: TextFormField(
//           controller: widget.controller,
//           obscureText: widget.obscureText,
//           decoration: InputDecoration(
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(20),
//               borderSide: BorderSide(
//                 color: Colors.black12,
//               ),
//             ),
//             focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide(color: Colors.grey.shade400)),
//             fillColor: Colors.grey.shade200,
//             filled: true,
//             hintText: widget.hintText,
//             icon: widget.icon,
//           ),
//           validator: widget.validator,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class Dialogconfirm extends StatelessWidget {
  const Dialogconfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
