import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_store/models/cart_product.dart';

class CartProductTile extends StatelessWidget {
  CartProductTile({super.key, required this.cartProduct});

  CartProduct? cartProduct;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: Image.network("${cartProduct?.product?.images?.first}"),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${cartProduct?.product?.name}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text('Tamanho: ${cartProduct?.size}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'R\$${cartProduct?.unitPrice}',
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                ],
              ),
            )),
            Column(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.add,color: primaryColor,)),
                Text(
                  '2',
                  style: TextStyle(fontSize: 18,color: primaryColor,fontWeight: FontWeight.bold),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.remove,color: primaryColor,))
              ],
            )
          ],
        ),
      ),
    );
  }

  void _confirmarPreco(CartProduct? cartProduct) {}
}
