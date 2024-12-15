import 'package:flutter/material.dart';
import 'package:new_store/models/cart_manage.dart';
import 'package:provider/provider.dart';

import '../../common/widgets/cart_product_tile.dart';

class CartProductScreens extends StatelessWidget {
  const CartProductScreens({super.key});

  @override
  Widget build(BuildContext context) {
    Color colorPrimary = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho '),
        backgroundColor: colorPrimary,
        centerTitle: true,
      ),
      body: Consumer<CartManager>(builder: (_,cartManager,__){
        return ListView(
          children: cartManager.items.map((cartProduct){
            return CartProductTile(cartProduct: cartProduct);
          }).toList(),
        );
      }),
    );
  }
}
