import 'package:flutter/material.dart';

import '../produtos_manager.dart';

class ProductsPage extends StatelessWidget {
  final List<Map<String, dynamic>> _produtos;
  
  ProductsPage(this._produtos);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Choose'),
            ),
            ListTile(
              title: Text('Manage Products'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/admin');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Flutter Course'),
        centerTitle: true,
      ),
      body: ProdutosManager(_produtos),
    );
  }
}
