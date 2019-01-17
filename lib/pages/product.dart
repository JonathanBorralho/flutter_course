import 'package:flutter/material.dart';

import 'dart:async';

class ProductPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductPage(this.product);

  @override
  Widget build(BuildContext context) {
    final String title = product['title'];
    final String imageUrl = product['image'];
    final String description = product['description'];
    final String price = product['price'].toString();
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Image.asset(imageUrl),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 26.0,
                    fontFamily: 'Oswald',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Union Square, San Francisco',
                  style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    '|',
                    style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
                  ),
                ),
                Text(
                  '\$$price',
                  style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
              ),
            )
          ],
        )),
      ),
    );
  }
}
