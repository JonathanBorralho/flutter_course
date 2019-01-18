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

  Widget _buildTitleTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Title',
      ),
      onChanged: (String value) {
        setState(() {
          this._title = value;
        });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Description'),
      onChanged: (String value) {
        setState(() {
          this._description = value;
        });
      },
      keyboardType: TextInputType.multiline,
      maxLines: 5,
    );
  }

  Widget _buildPriceTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Price'),
      onChanged: (String value) {
        setState(() {
          this._price = double.parse(value);
        });
      },
      keyboardType: TextInputType.number,
    );
  }

  void _submitForm() {
    final Map<String, dynamic> produto = {
      'title': _title,
      'description': _description,
      'price': _price,
      'image': 'assets/food.jpg'
    };
    widget._addProduct(produto);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 520.0 : deviceWidth;
    final double targetPadding = deviceWidth - targetWidth;

    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
        children: [
          _buildTitleTextField(),
          _buildDescriptionTextField(),
          _buildPriceTextField(),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            child: Text('SAVE'),
            onPressed: _submitForm,
          )
        ],
      ),
    );
  }
}
