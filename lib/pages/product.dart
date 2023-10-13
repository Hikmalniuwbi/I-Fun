import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas_ecommerce/widget/carousel.dart';
import 'package:tugas_ecommerce/widget/grid_product.dart';
import 'package:tugas_ecommerce/widget/btn_profile.dart';
import 'package:tugas_ecommerce/widget/searchbar.dart';

class Productpage extends StatelessWidget {
  const Productpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        backgroundColor: CupertinoColors.darkBackgroundGray,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'i FUN ',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
        ),
        actions: [Buttonprofile()],
      ),
      body: BottomAppBar(
        color: Colors.white70,
        child: ListView(
          children: [
            // searchbar\
            Searchbarcostum(),
            //
            Container(
              child: Carousel(),
            ),
            // Kategoricostum(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Gridproduct(),
            ),
          ],
        ),
      ),
    );
  }
}
