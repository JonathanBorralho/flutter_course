import 'package:flutter/material.dart';

import './product_create.dart';
import './product_list.dart';

class ProductsAdminPage extends StatelessWidget {
  final Function _addProduct;
  final Function _deleteProduct;

  ProductsAdminPage(this._addProduct, this._deleteProduct);

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Choose'),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            title: Text('All Products'),
            leading: Icon(Icons.shop),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/products');
            },
          )
        ],
      ),
    );
  }

  List<Widget> _buildTabs() {
    return [
      Tab(
        icon: Icon(Icons.create),
        child: Text('Create Product'),
      ),
      Tab(
        icon: Icon(Icons.list),
        child: Text('My Products'),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildDrawer(context),
        appBar: AppBar(
          bottom: TabBar(
            tabs: _buildTabs(),
          ),
          title: Text('Product Admin Page'),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductCreatePage(_addProduct, _deleteProduct),
            ProductListPage(),
          ],
        ),
      ),
    );
  }
}
