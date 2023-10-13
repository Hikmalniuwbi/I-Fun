import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tugas_ecommerce/widget/formlogin.dart';

class Loginpage extends StatefulWidget {
  Loginpage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      resizeToAvoidBottomInset: false,
      body: OrientationBuilder(builder: (context, orientation) {
        final isLandscape = orientation == Orientation.landscape;

        return SingleChildScrollView(
          physics:
              isLandscape ? ScrollPhysics() : NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: Animate(
                  effects: [FadeEffect(delay: 500.ms)],
                  child: Text(
                    'i FUN',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60),
              Container(
                height: MediaQuery.of(context).size.height * 1.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(100)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 50, right: 100, top: 80),
                      child: Animate(
                        effects: [
                          FadeEffect(delay: 500.ms),
                        ],
                        child: Column(
                          children: [
                            Text(
                              'WELCOME BACK',
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: FormLogin(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
