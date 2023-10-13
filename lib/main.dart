import 'package:flutter/material.dart';
import 'package:tugas_ecommerce/pages/edit_profile.dart';
import 'package:tugas_ecommerce/pages/registerpage.dart';
import 'package:tugas_ecommerce/pages/homepage.dart';
import 'package:tugas_ecommerce/pages/login_page.dart';
import 'package:tugas_ecommerce/pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(textTheme: TextTheme(bodyMedium: TextStyle())),
      // home: Loginpage(),
      initialRoute: '/',
      routes: {
        '/': (context) => Loginpage(),
        '/register': (context) => Registerpage(),
        '/homepage': (context) => HomePage(),
        '/profilepage': (context) => Profilepage(),
        '/editprofile': (context) => Editprofile(),
      },
    );
  }
}
