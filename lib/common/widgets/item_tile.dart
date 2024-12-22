import 'package:flutter/material.dart';
import 'package:new_store/models/product_manager.dart';
import 'package:new_store/models/section_items.dart';
import 'package:provider/provider.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({super.key, required this.item});
  final SectionItem item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(item.productId != null){
          final product = context.read<ProductManager>().findProductById(item.productId!);
          if(product != null){
            Navigator.of(context).pushNamed('/productScreens',arguments: product);

          }


        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: SizedBox(
            width: 180,
            height: 180,
            child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  '${item.image}',
                  fit: BoxFit.cover,
                ))),
      ),
    );
  }
}
