import 'package:flutter/material.dart';

class ProductsScreesns extends StatelessWidget {
  const ProductsScreesns({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('produtos'),centerTitle: true,),
      body: const Center(child:Text('ola pedido') ,),
    );
  }
}
