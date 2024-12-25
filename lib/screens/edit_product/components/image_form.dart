import 'package:flutter/material.dart';
import 'package:new_store/models/product.dart';
import 'dart:io';

class ImageForm extends StatelessWidget {
  const ImageForm({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    return FormField<List>(
        initialValue: product.images,
        builder: (state) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: state.value!.map((img) {
                return SizedBox(
                  width: largura * 2,
                  height: largura,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      //Image.network(img),
                      if(img is String)
                        Image.network(img)
                      else
                        Image.file(img),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.remove)),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          );
        });
  }
}
