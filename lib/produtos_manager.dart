import 'package:flutter/material.dart';

import './produtos.dart';
import './product_control.dart';

class ProdutosManager extends StatefulWidget {
  final Map<String, String> startingProduct;

  ProdutosManager({this.startingProduct});

  @override
  State<StatefulWidget> createState() {
    return _ProdutosManagerState();
  }
}

class _ProdutosManagerState extends State<ProdutosManager> {
  List<Map<String, String>> _produtos = [];

  void _addProduct(Map<String, String> product) {
    setState(() {
      _produtos.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _produtos.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.startingProduct != null) {
      _produtos = [widget.startingProduct];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ProductControl(_addProduct),
        Expanded(
          child: Produtos(
          _produtos,
          deleteProductFn: _deleteProduct,
        )),
      ],
    );
  }
}
