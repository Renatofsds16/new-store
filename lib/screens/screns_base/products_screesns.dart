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
        title: Consumer<ProductManager>(
          builder: (_, productManage,__){
            if(productManage.seach != null){
              return GestureDetector(
                onTap: (){
                  _showTextField(context);
                },
                child: Text(
                  '${productManage.seach}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              );
            }
            else{
              return const Text(
                'Produtos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              );
            }
        },
        ),
        backgroundColor: const Color.fromARGB(255, 4, 125, 141),
        centerTitle: true,
        actions: [
          Consumer<ProductManager>(
              builder: (_,productManager,__){
                if(productManager.seach == null){
                  return IconButton(
                      onPressed: ()async {
                        final String? search = await  _showTextField(context);
                        if(search != null ){
                          productManager.seach = search;
                        }
                      },
                      icon: const Icon(
                        Icons.search,
                      ));
                }

                else{
                  return IconButton(
                    onPressed: (){
                      productManager.seach = null;
                    }, icon: const Icon(Icons.close),

                  );
                }
              }
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add))
        ],
      ),
      body: Consumer<ProductManager>(
        builder: (_, productManager, __) {
          final filterProducts = productManager.filterProduct;
          return ListView.builder(
              itemCount: filterProducts.length,
              itemBuilder: (_, index) {
                return ProductListTile(
                    product: filterProducts[index]);
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
