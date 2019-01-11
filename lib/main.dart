import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import './pages/products.dart';
import './pages/products_admin.dart';

main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  List<Map<String, dynamic>> _produtos = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      routes: {
        '/': (context) => ProductsPage(_produtos),
        '/admin': (context) => ProductsAdminPage(_addProduct, _deleteProduct),
      },
    );
  }

  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      _produtos.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _produtos.removeAt(index);
    });
  }
}
