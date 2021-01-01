import 'package:flutter/material.dart';
import 'package:univus_app/models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = "/product-detail";

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    
    return Scaffold(
      appBar: AppBar(title: Text('title')),
    );
  }
}
