import 'package:flutter/material.dart';

import './produtos.dart';

class ProdutosManager extends StatelessWidget {
  final List<Map<String, dynamic>> _produtos;

  ProdutosManager(this._produtos);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Produtos(_produtos)
        ),
      ],
    );
  }
}
