import 'package:flutter/material.dart';
import 'package:new_store/models/cart_manage.dart';
import 'package:new_store/models/item_size.dart';
import 'package:new_store/models/product.dart';
import 'package:new_store/models/user_manager.dart';
import 'package:provider/provider.dart';

import '../../common/widgets/widget_size.dart';

class ProductScreesns extends StatelessWidget {
  const ProductScreesns({super.key, required this.args});
  final Map<String, Product>? args;

  @override
  Widget build(BuildContext context) {
    Product? product = args?['product'];
    List<String> productImages = listImage(product?.images);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    final primaryColor = Theme.of(context).primaryColor;
    return ChangeNotifierProvider.value(
      value: product,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, // Defina a cor desejada
          ),
          backgroundColor: primaryColor,
          title: Text('${product?.name}',
              style: const TextStyle(
                color: Colors.white,
              )),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: productImages.map((img) {
                  return SizedBox(
                    width: width,
                    height: height,
                    child: Image.network(img),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${product?.name}",
                    style: TextStyle(fontSize: 32, color: primaryColor),
                  ),
                  Text('A parti de:',
                      style: TextStyle(fontSize: 16, color: Colors.grey[500])),
                  Text('R\$ 19,99',
                      style: TextStyle(
                          fontSize: 18,
                          color: primaryColor,
                          fontWeight: FontWeight.bold)),
                  const Text('Descricao',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('${product?.description}',
                      style: const TextStyle(fontSize: 16)),
                  // itens de tamanhos aqui
                  const Text('Tamanhos',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Wrap(
                    spacing: 4,
                    children: product!.sizes!.map((item) {
                      ItemSize itemSize = item as ItemSize;
                      return WidgetSize(
                        itemSize: itemSize,
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  if(product.hasStock)
                    Consumer2<UserManager, Product>(
                      builder: (_, userManager, product, __) {
                        return Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        primaryColor, // Altere para a cor desejada
                                    foregroundColor: Colors.white, // Cor do texto
                                  ),
                                  onPressed:
                                      product.selectedSize != null ? () async {
                                    if(userManager.loggedIn){
                                      //adicionar ao carrinho aqui
                                      await context.read<CartManager>().addToCartProduct(product);
                                      Navigator.pushNamed(context,'/cart');
                                    }else{
                                      Navigator.pushNamed(context, '/login');
                                    }
                                      } : null,
                                  child: Text(userManager.loggedIn
                                      ? 'adicionar ao carinho'
                                      : 'entre para compra')),
                            )
                          ],
                        );
                      },
                    )
                ],
              ),
            )
          ],
        ),

      ),
    );
  }


  List<String> listImage(List<String>? list) {
    List<String> images = [];
    if (list != null) {
      for (String image in list) {
        images.add(image);
      }
    }
    return images;
  }

}
