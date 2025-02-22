import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_store/models/product.dart';
import 'dart:io';

import 'image_source_sheet.dart';

class ImageForm extends StatelessWidget {
  const ImageForm({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {

    return FormField<List<dynamic>>(
      initialValue: List.from(product.images!),
      builder: (state) {
        void onImageSelected(File file) {
          state.value?.add(file);
          state.didChange(state.value);
          Navigator.of(context).pop();
        }
        return SizedBox(
          height: 400,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: state.value!.map<Widget>((image) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      if (image is String)
                        Image.network(
                          image,
                          fit: BoxFit.cover,
                        )
                      else
                        Image.file(image),
                      Positioned(
                          top: 10,
                          right: 10,
                          child: ElevatedButton(
                            onPressed: () {
                              state.value!.remove(image);
                              state.didChange(state.value);
                            },
                            child: const Text(
                              'Remover',
                              style: TextStyle(color: Colors.red),
                            ),
                          ))
                    ],
                  ),
                ),
              );
            }).toList()
              ..add(AspectRatio(
                aspectRatio: 1,
                child: Container(
                  color: Colors.grey[200],
                  child: IconButton(
                      onPressed: () {
                        if(Platform.isAndroid){
                          showModalBottomSheet(context: context, builder: (context)=> ImageSourceSheet(onImageSelected: onImageSelected,));
                        }else{
                          showCupertinoModalPopup(context: context, builder: (context)=> ImageSourceSheet(onImageSelected: onImageSelected,));
                        }

                      },
                      icon: Icon(
                        Icons.add_a_photo,
                        color: Theme.of(context).primaryColor,
                        size: 50,
                      )),
                ),
              )),
          ),
        );
      },
    );
  }
}
