import 'package:flutter/material.dart';

import './pages/product.dart';

class Produtos extends StatelessWidget {
  final List<Map<String,String>> produtos;
  final Function deleteProductFn;

  Produtos(this.produtos, {this.deleteProductFn});

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(produtos[index]['image']),
          Text(produtos[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Detail'),
                onPressed: () {
                  Navigator.push<bool>(
                    context,
                    MaterialPageRoute(builder: (context) => ProductPage(produtos[index])),
                  ).then((value) {
                    if (value) {
                      deleteProductFn(index);
                    }
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductsList() {
    Widget list;
    if (produtos.length > 0) {
      list = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: produtos?.length ?? 0,
      );
    } else {
      list = Center(
        child: Text('Não há produtos cadastrados.'),
      );
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductsList();
  }
}
