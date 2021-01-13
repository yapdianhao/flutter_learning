import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/cart_item.dart';
import '../providers/cart.dart' show Cart;

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Your Cart'),
        ),
        body: Column(
          children: [
            Card(
                margin: EdgeInsets.all(15),
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('total',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Chip(
                          label: Text(
                            '\$${cart.totalAmount}',
                            style: TextStyle(
                              color: Theme.of(context).primaryTextTheme.bodyText1.color,
                            )
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        FlatButton(
                          onPressed: null, 
                          child: Text('Order now'),
                          textColor: Theme.of(context).primaryColor,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.itemCount,
                    itemBuilder: (ctx, i) => 
                      CartItem(
                        cart.items.values.toList()[i].id, 
                        cart.items.keys.toList()[i],
                        cart.items.values.toList()[i].price, 
                        cart.items.values.toList()[i].quantity, 
                        cart.items.values.toList()[i].title
                      )
                  )
                )
              ],
            ),
          );
  }
}
