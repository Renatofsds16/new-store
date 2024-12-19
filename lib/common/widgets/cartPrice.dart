import 'package:flutter/material.dart';
import 'package:new_store/models/cart_manage.dart';
import 'package:provider/provider.dart';

class CartPrice extends StatelessWidget {
  CartPrice({super.key,required this.textButton,required this.onPressed});

  VoidCallback? onPressed;
  String? textButton;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    final cartManage = context.watch<CartManager>();
    final totalPrice = cartManage.productsTotalPrice;
    final frete = 5.54;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Resumo do pedido',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Subtotal',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text(totalPrice.toStringAsFixed(2),
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Frete',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text('$frete',
                    style:
                        const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 const Text('Total',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text('${totalPrice + frete}',
                    style:
                        const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: onPressed,
                          style: ElevatedButton.styleFrom(
                            disabledBackgroundColor: color.withAlpha(100),
                              backgroundColor: color,
                              foregroundColor: Colors.white),
                          child: Text('$textButton')))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
