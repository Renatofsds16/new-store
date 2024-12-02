import 'package:flutter/material.dart';
import 'package:new_store/models/product.dart';

class ProductScreesns extends StatelessWidget {
  const ProductScreesns({super.key,required this.args});
  final Map<String,Product>? args;


  @override
  Widget build(BuildContext context) {
    Product? product = args?['product'];
    List<String> productImages = listImage(product?.images);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Defina a cor desejada
        ),
        backgroundColor: primaryColor,
        title: Text(product!.name.toString(),style: const TextStyle(
          color: Colors.white,
        ))
        ,centerTitle: true,
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(

              children: [
                for(String img in productImages)
                  SizedBox(
                    width: width,
                    height: height,
                    child: Image.network(img),
                  )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${product.name}",style: TextStyle(fontSize: 32,color:primaryColor),),
                Text('A parti de:',style: TextStyle(fontSize: 16,color:Colors.grey[500])),
                Text('R\$ 19,99',style: TextStyle(fontSize: 18,color: primaryColor,fontWeight:FontWeight.bold)),
                const Text('Descricao',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                Text('${product.description}',style: const TextStyle(fontSize: 16)),
                // itens de tamanhos aqui
                const SizedBox(
                  height: 100,
                ),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor, // Altere para a cor desejada
                            foregroundColor: Colors.white, // Cor do texto
                          ),
                          onPressed: (){}, child: const Text("adicionar ao carinho")
                      ),
                    )
                  ],
                )


              ],
            ),
          )
        ],
      ),
    );
  }
  List<String> listImage(List<String>? list){
    List<String> images = [];
    if(list != null){
      for(String image in list){
        images.add(image);
      }
      
    }
    return images;
  }
}
