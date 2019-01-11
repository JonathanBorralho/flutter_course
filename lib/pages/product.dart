import 'package:flutter/material.dart';

import 'dart:async';

class ProductPage extends StatelessWidget {
  final Map<String, String> product;

  ProductPage(this.product);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(product['title']),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Image.asset(product['image']),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(product['title']),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: _buildDeleteButton(context),
            )
          ],
        )),
      ),
    );
  }

  Widget _buildDeleteButton(BuildContext context) {
    return RaisedButton.icon(
      textTheme: ButtonTextTheme.primary,
      color: Theme.of(context).accentColor,
      label: Text('Delete'),
      icon: Icon(Icons.delete),
      onPressed: () {
        Navigator.pop(context, true);
      },
    );
  }
}
