import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function addProductFn;

  ProductControl(this.addProductFn);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      textTheme: ButtonTextTheme.primary,
      color: Theme.of(context).accentColor,
      child: Text('Adicionar Produto'),
      onPressed: () {
        addProductFn({'title':'Outro Produto', 'image': 'assets/food.jpg'});
      },
    );
  }
}
