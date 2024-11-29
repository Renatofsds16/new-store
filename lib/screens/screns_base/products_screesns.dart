import 'package:flutter/material.dart';
import 'package:new_store/common/common_drawer/drawer_custom.dart';
import 'package:new_store/common/widgets/product_list_tile.dart';
import 'package:new_store/models/product_manager.dart';
import 'package:provider/provider.dart';

class ProductsScreesns extends StatelessWidget {
  const ProductsScreesns({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerCusnton(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Produtos',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 4, 125, 141),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: ()async {
               final String? search = await  _showTextField(context);
               if(search != null){
                 context.read<ProductManager>().seach = search;
               }


              },
              icon: const Icon(
                Icons.search,
              )),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add))
        ],
      ),
      body: Consumer<ProductManager>(
        builder: (_, productManager, __) {
          return ListView.builder(
              itemCount: productManager.allProducts.length,
              itemBuilder: (_, index) {
                return ProductListTile(
                    product: productManager.allProducts[index]);
              });
        },
      ),
    );
  }

  _showTextField(BuildContext context) {
    Future<dynamic> text = showDialog(
        context: context,
        builder: (context) {
          return Stack(
            children: [
              Positioned(
                  top: 2,
                  left: 16,
                  right: 16,
                  child: Card(
                    child: TextFormField(
                      textInputAction: TextInputAction.search,
                      autofocus: true,
                      decoration: InputDecoration(
                        prefix: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.arrow_back_ios)),
                        border: InputBorder.none,
                      ),
                      onFieldSubmitted: (text){
                        Navigator.of(context).pop(text);
                      },
                    ),
                  ))
            ],
          );
        });
    return text;
  }
}
