import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:tugas_ecommerce/data/Data.dart';
import 'package:tugas_ecommerce/pages/register_controller.dart';
import 'package:tugas_ecommerce/widget/dropdowncustom.dart';
import 'package:tugas_ecommerce/widget/formfield.dart';
// const List<String> list = <String>['Pria', 'Wanita'];

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final _formKey = GlobalKey<FormState>();

  final Regis = Get.put(Registercontroller());

  String? select;
  String? kota;
  bool isVisible = true;

  String pilihgender = "Pria";

  String pilihkota = "Pontianak";
  bool berhasilDisimpan = false;
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
              'EDIT PROFILE',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          actions: [
            SizedBox(
              width: 30,
            )
          ],
        ),
        body: ListView(
          children: [
            FormfieldCustom(
              TextInputAction: TextInputAction.next,
              controller: Regis.namalengkapController,
              labeltext: 'Nama lengkap',
              validator: (value) {
                return value!.length < 3
                    ? "harus terisi minimum 3 karakter"
                    : null;
              },
            ),
            FormfieldCustom(
              TextInputAction: TextInputAction.next,
              controller: Regis.usernameController,
              labeltext: 'Username',
              validator: (value) {
                return value!.length < 5
                    ? "harus terisi minimum 5 karakter"
                    : null;
              },
            ),
            FormfieldCustom(
              TextInputAction: TextInputAction.next,
              controller: Regis.emailController,
              labeltext: 'Email',
              validator: (value) {
                return value!.isEmpty ? "harap isi email" : null;
              },
            ),
            FormfieldCustom(
              TextInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              controller: Regis.nomorhpController,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              labeltext: 'Nomor Telepon',
              validator: (value) {
                return value!.isEmpty ? "harap isi Nomor telepon" : null;
              },
            ),
            FormfieldCustom(
              TextInputAction: TextInputAction.next,
              controller: Regis.passwordController,
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
              labelText: 'Gender',
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
                return value == null ? "Pilih gender" : null;
              },
            ),

            FormfieldCustom(
              controller: Regis.alamatController,
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

            // button simpan

            Padding(
              padding: EdgeInsets.all(20),
              child: TextButton(
                style: TextButton.styleFrom(
                    fixedSize: Size(100, 50),
                    foregroundColor: CupertinoColors.darkBackgroundGray,
                    backgroundColor: CupertinoColors.darkBackgroundGray,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                child: Text(
                  'Simpan',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, '/homepage');
                  }
                  setState(
                    () {
                      berhasilDisimpan = true;
                    },
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('berhasil disimpan'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ),

            if (berhasilDisimpan)
              Container(
                alignment: Alignment.center,
                child: Text(
                  'berhasil disimpan',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
