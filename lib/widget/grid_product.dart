import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tugas_ecommerce/data/Data.dart';
import 'package:tugas_ecommerce/pages/detail_product.dart';

class Gridproduct extends StatelessWidget {
  const Gridproduct({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final CrossAxisCount = isLandscape ? 4 : 2;
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 12.0,
        crossAxisCount: CrossAxisCount,
        mainAxisSpacing: 12.0,
        mainAxisExtent: 340,
      ),
      itemCount: Listproducts.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Detailproduct(
                    images: Listproducts[index]["images"],
                    price: Listproducts[index]["price"],
                    title: Listproducts[index]["title"],
                    rating: Listproducts[index]["rating"],
                    deskripsi: Listproducts[index]["deskripsi"])));
          },
          child: Container(
            // width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 1),
                      blurRadius: 2,
                      spreadRadius: 2),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0)),
                  child: Image.asset(
                    '${Listproducts.elementAt(index)['images']}',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 2,
                          color: Colors.grey.shade300,
                          margin: EdgeInsets.all(10)),
                      Text(
                        '${Listproducts.elementAt(index)['title']}',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 20),
                      ),
                      Text(
                        '${Listproducts.elementAt(index)['price']}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RatingBar.builder(
                            initialRating: 4,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 1,
                            itemSize: 24,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Text(
                            '${Listproducts.elementAt(index)['rating']}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(width: 40),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.shopping_cart_outlined,
                                size: 25,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
