import 'package:flutter/material.dart';
import 'package:new_store/models/product.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({super.key, required this.product});
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 100,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Image.network(product!.images!.first.toString()),
              ),
              const SizedBox(width: 16,),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    product!.name.toString(),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text('A partir de',style: TextStyle(fontSize: 12,color: Colors.grey[600]),),
                  Text('R\$18,99',style: TextStyle(fontSize: 18,color: Theme.of(context).primaryColor),),

                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
