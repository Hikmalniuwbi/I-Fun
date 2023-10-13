import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:tugas_ecommerce/pages/registerpage.dart';
import 'package:tugas_ecommerce/pages/register_controller.dart';
import 'package:tugas_ecommerce/widget/custombtn.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final Regis = Get.put(Registercontroller());

  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry formPadding = EdgeInsets.all(10.0);
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      formPadding == EdgeInsets.all(30.0);
    }
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: formPadding,
            child: SizedBox(
              width: 600,
              child: TextFormField(
                textInputAction: TextInputAction.next,
                controller: Regis.emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: 'Email',
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black12)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                ),
                validator: (value) {
                  return value!.length < 5 ? "Isi Email" : null;
                },
              ),
            ),
          ),
          Padding(
            // padding: const EdgeInsets.all(8.0),
            padding: formPadding,
            child: SizedBox(
              width: 600,
              child: TextFormField(
                textInputAction: TextInputAction.done,
                controller: Regis.passwordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black12)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                ),
                validator: (value) {
                  return value!.length < 5 ? "isi password" : null;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Custombutton(
                text: 'LOGIN',
                backgroundColor: CupertinoColors.darkBackgroundGray,
                textColor: Colors.white,
                onPressed: () {
                  setState(() {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, '/homepage');
                    }
                  });
                }),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('belum punya akun?'),
                  SizedBox(
                    width: 3,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Registerpage()),
                      );
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.blue, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SignInButton(
              Buttons.google,
              text: "Sign up with Google",
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              padding: EdgeInsets.all(10),
              elevation: 5,
              onPressed: () {
                Navigator.pushNamed(context, '/homepage');
              },
            ),
          )
        ],
      ),
    );
  }
}
