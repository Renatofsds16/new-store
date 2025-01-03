import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_store/models/cart_product.dart';
import 'package:provider/provider.dart';

class CartProductTile extends StatelessWidget {
  CartProductTile({super.key, required this.cartProduct});

  CartProduct? cartProduct;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return ChangeNotifierProvider.value(
      value: cartProduct,
      child: Card(
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
                      child: Consumer<CartProduct>(builder: (_,cartProduct,__){
                        if(cartProduct.hasStock){
                          return Text(
                            'R\$${cartProduct.unitPrice}',
                            style: TextStyle(color: primaryColor),
                          );
                        }else{
                          return const Text(
                            'sem estoque suficiente',
                            style: TextStyle(color: Colors.red),
                          );
                        }

                      }),
                    ),
                  ],
                ),
              )),
              Consumer<CartProduct?>(
                builder: (_,cartProduct,__){
                  return Column(
                    children: [
                      IconButton(onPressed: cartProduct?.increment, icon: Icon(Icons.add,color: primaryColor,)),
                      Text(
                        '${cartProduct?.quantity}',
                        style: TextStyle(fontSize: 18,color: primaryColor,fontWeight: FontWeight.bold),
                      ),
                      IconButton(onPressed: cartProduct?.decrement, icon: Icon(Icons.remove,color: primaryColor,))
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _confirmarPreco(CartProduct? cartProduct) {}
}
