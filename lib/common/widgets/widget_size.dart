import 'package:flutter/material.dart';
import 'package:new_store/main.dart';
import 'package:new_store/models/item_size.dart';
import 'package:new_store/models/product.dart';
import 'package:provider/provider.dart';

class WidgetSize extends StatelessWidget {
  WidgetSize({super.key, required this.itemSize});
  ItemSize? itemSize;

  @override
  Widget build(BuildContext context) {
    final product = context.watch<Product>();
    final selected = itemSize == product.selectedSize;
    return Container(
      decoration: BoxDecoration(
        border:
            Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: !itemSize!.hasStock ? Colors.red : Colors.grey,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text('${itemSize?.name}'),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text("${itemSize?.price}"),
          )
        ],
      ),
    );
  }
}
