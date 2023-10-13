import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:tugas_ecommerce/pages/login_page.dart';
import 'package:tugas_ecommerce/data/Data.dart';
import 'package:tugas_ecommerce/pages/register_controller.dart';
import 'package:tugas_ecommerce/widget/dropdowncustom.dart';
import 'package:tugas_ecommerce/widget/formfield.dart';
// const List<String> list = <String>['Pria', 'Wanita'];

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final _formKey = GlobalKey<FormState>();

  final Regis = Get.put(Registercontroller());

  String? select;
  String? kota;
  bool isVisible = true;

  String pilihgender = "Pria";

  String pilihkota = "Pontianak";

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.transparent,
              title: Center(
                child: Text(
                  'Create Your Account ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            ),
            body: ListView(children: [
              FormfieldCustom(
                controller: Regis.namalengkapController,
                TextInputAction: TextInputAction.next,
                labeltext: 'Nama lengkap',
                validator: (value) {
                  return value!.length < 3
                      ? "harus terisi minimum 3 karakter"
                      : null;
                },
              ),
              FormfieldCustom(
                controller: Regis.usernameController,
                TextInputAction: TextInputAction.next,
                labeltext: 'Username',
                validator: (value) {
                  return value!.length < 5
                      ? "harus terisi minimum 5 karakter"
                      : null;
                },
              ),
              FormfieldCustom(
                controller: Regis.emailController,
                TextInputAction: TextInputAction.next,
                labeltext: 'Email',
                validator: (value) {
                  return value!.isEmpty ? "harap isi email" : null;
                },
              ),
              FormfieldCustom(
                keyboardType: TextInputType.number,
                controller: Regis.nomorhpController,
                TextInputAction: TextInputAction.next,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                labeltext: 'Nomor Telepon',
                validator: (value) {
                  return value!.isEmpty ? "harap isi Nomor telepon" : null;
                },
              ),
              FormfieldCustom(
                controller: Regis.passwordController,
                TextInputAction: TextInputAction.next,
                labeltext: 'Password',
                obscureText: isVisible,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon: Icon(
                    isVisible ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                validator: (value) {
                  return value!.isEmpty ? "isi password" : null;
                },
              ),

              DropdownFormFieldCustom(
                labelText: 'Jenis Kelamin',
                value: select,
                items: ['laki laki', 'perempuan']
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    Regis.selectedGender = newValue!;
                    // regis.gender.text = newValue;
                  });
                },
                validator: (value) {
                  return value == null ? "Pilih Jenis Kelamin" : null;
                },
              ),

              FormfieldCustom(
                controller: Regis.alamatController,
                TextInputAction: TextInputAction.next,
                labeltext: 'alamat',
                expand: true,
                validator: (value) {
                  return value!.isEmpty ? "harap isi alamat" : null;
                },
              ),

              DropdownFormFieldCustom(
                labelText: 'Kota',
                value: kota,
                items: kotas
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    Regis.selectedKota = newValue!;
                    // regis.gender.text = newValue;
                  });
                },
                validator: (value) {
                  return value == null ? "Pilih kota" : null;
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('sudah punya akun?'),
                  SizedBox(
                    width: 3,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => Loginpage()),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.blue, fontSize: 14),
                    ),
                  ),
                ],
              ),

              // BUTTONREGISTER
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    fixedSize: Size(100, 50),
                    foregroundColor: CupertinoColors.darkBackgroundGray,
                    backgroundColor: CupertinoColors.darkBackgroundGray,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  child: Text(
                    'REGISTER',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, '/homepage');
                    }
                    // showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return AlertDialog(
                    //         title: Text('konfirmasi registrasi'),
                    //         content: Text('Anda yakin ingin mendaftar?'),
                    //         actions: [
                    //           TextButton(
                    //             onPressed: () {
                    //               Navigator.of(context).pop();
                    //             },
                    //             child: Text('batal'),
                    //           ),
                    //           TextButton(
                    //             onPressed: () {
                    //               Navigator.of(context).pop();
                    //             },
                    //             child: Text('ya'),
                    //           ),
                    //         ],
                    //       );
                    //     });
                  },
                ),
              ),
            ])));
  }
}
