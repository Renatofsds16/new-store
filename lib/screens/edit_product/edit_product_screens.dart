import 'package:flutter/material.dart';
import 'package:new_store/models/product.dart';

import 'components/image_form.dart';

class EditProductScreens extends StatelessWidget {
  const EditProductScreens({super.key,required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    print(product.images);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Edita Anuncio',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: color,
      ),
      body: ListView(
        children: [
          ImageForm(product: product,)
        ],
      ),
    );
  }
}

