import 'package:flutter/material.dart';

import 'package:flutter_course/widgets/product_card.dart';

class Produtos extends StatelessWidget {
  final List<Map<String, dynamic>> produtos;

  Produtos(this.produtos);
  
  @override
  Widget build(BuildContext context) {
    return _buildProductsList();
  }

  Widget _buildProductsList() {
    Widget list;
    if (produtos.length > 0) {
      list = ListView.builder(
        itemBuilder: (BuildContext context, index) => ProductCard(produtos[index]),
        itemCount: produtos?.length ?? 0,
      );
    } else {
      list = Center(
        child: Text('Não há produtos cadastrados.'),
      );
    }

    return list;
  }

}
