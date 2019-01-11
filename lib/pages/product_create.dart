import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function _addProduct;
  final Function _deleteProduct;

  ProductCreatePage(this._addProduct, this._deleteProduct);

  @override
  _ProductCreatePageState createState() {
    return new _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _title;
  String _description;
  double _price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Title',
            ),
            onChanged: (String value) {
              setState(() {
                this._title = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Description'),
            onChanged: (String value) {
              setState(() {
                this._description = value;
              });
            },
            keyboardType: TextInputType.multiline,
            maxLines: 5,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Price'),
            onChanged: (String value) {
              setState(() {
                this._price = double.parse(value);
              });
            },
            keyboardType: TextInputType.number,
          ),
          RaisedButton(
            child: Text('Save'),
            onPressed: () {
              // criar produto e chamar adicionarProduto()
              final Map<String, dynamic> produto = {
                'title': _title, 'description': _description, 'price': _price, 'image': 'assets/food.jpg'
              };
              widget._addProduct(produto);
            },
          )
        ],
      ),
    );
  }
}
