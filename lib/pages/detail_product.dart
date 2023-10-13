import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas_ecommerce/widget/ratingbar.dart';

class Detailproduct extends StatefulWidget {
  final String images;
  final String title;
  final String deskripsi;
  final String price;
  final String rating;

  const Detailproduct({
    Key? key,
    required this.images,
    required this.title,
    required this.deskripsi,
    required this.price,
    required this.rating,
  }) : super(key: key);

  @override
  State<Detailproduct> createState() => _DetailproductState();
}

class _DetailproductState extends State<Detailproduct> {
  bool isLiked = false;
  bool isSave = false;

  @override
  Widget build(BuildContext context) {
    final lanscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: CupertinoColors.darkBackgroundGray,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 250,
              forceElevated: innerBoxIsScrolled,
              backgroundColor: CupertinoColors.darkBackgroundGray,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(widget.images, height: 200),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // width: double.infinity,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    offset: const Offset(1, 4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                      left: 30,
                      right: 20,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              IconButton(
                                iconSize: 30,
                                icon: Icon(
                                  isLiked
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isLiked ? Colors.red : Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isLiked = !isLiked;
                                  });
                                },
                              ),
                              IconButton(
                                iconSize: 30,
                                icon: Icon(
                                  isSave
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  color: isSave ? Colors.black : Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isSave = !isSave;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 0,
                      left: 30,
                      right: 20,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.price,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Rating(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: Text(
                        widget.deskripsi,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      //
      //
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 3),
              blurRadius: 7,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Text(
                widget.price,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  padding: lanscape
                      ? EdgeInsets.symmetric(vertical: 10, horizontal: 250)
                      : EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  backgroundColor: CupertinoColors.darkBackgroundGray,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text(
                'Add To Cart',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
