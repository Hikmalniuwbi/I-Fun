import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_ecommerce/pages/register_controller.dart';
import 'package:tugas_ecommerce/widget/custombtn.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  final data = Get.put(Registercontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: CupertinoColors.darkBackgroundGray,
        title: Text(
          'User Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 150,

            color: CupertinoColors.darkBackgroundGray,
            padding:
                EdgeInsets.all(16.0), // Tambahkan padding sesuai kebutuhan Anda
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 50,
                  child: Icon(
                    Icons.person_2_rounded,
                    size: 70,
                    color: Colors.grey,
                  ),
                  backgroundColor: Colors.white,
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(data.usernameController.text,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(data.emailController.text,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          )),
                    )
                  ],
                ),
              ],
            ),
          ),

          ListTile(
            title: Text('Nama'),
            subtitle: Text(data.namalengkapController.text),
          ),
          ListTile(
            title: Text('Username'),
            subtitle: Text(data.usernameController.text),
          ),
          ListTile(
            title: Text('Email'),
            subtitle: Text(data.emailController.text),
          ),
          ListTile(
            title: Text('Nomor HP'),
            subtitle: Text(data.nomorhpController.text),
          ),
          // ListTile(
          //   title: Text('Password'),
          //   subtitle: Text(data.passwordController.text),
          // ),
          ListTile(
            title: Text('Alamat'),
            subtitle: Text(data.alamatController.text),
          ),
          ListTile(
            title: Text('Jenis Kelamin'),
            subtitle: Container(child: Text(data.selectedGender.toString())),
          ),
          ListTile(
            title: Text('Kota'),
            subtitle: Text(data.selectedKota.toString()),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Custombutton(
              text: 'Edit Profile',
              backgroundColor: CupertinoColors.darkBackgroundGray,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, '/editprofile');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
            child: Custombutton(
              text: 'Log out',
              backgroundColor: Colors.red,
              textColor: Colors.white,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Log out'),
                        content: Text('Apakah anda yakin ingin keluar?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('batal'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/');
                            },
                            child: Text('ya'),
                          ),
                        ],
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
