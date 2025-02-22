import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheet extends StatelessWidget {
  ImageSourceSheet({super.key,required this.onImageSelected});
  final ImagePicker imagePicker = ImagePicker();
  final Function onImageSelected;


  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    if(Platform.isAndroid){
      return BottomSheet(
          onClosing: (){},
          builder: (context)=> Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(onPressed: ()async{
                final XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
                if(file != null){
                  onImageSelected(File(file.path));
                };

              }, child: Text('Camera',style: TextStyle(color: color),)),
              TextButton(onPressed: ()async{
                final XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
                if(file != null){
                  onImageSelected(File(file.path));
                };
              }, child: Text('Galeria',style: TextStyle(color: color))),
            ],
          )
      );
    }else{
      return CupertinoActionSheet(
        title: const Text('Selecione foto'),
        message: const Text('Selecione a origem da foto'),
        cancelButton: CupertinoActionSheetAction(onPressed: (){Navigator.of(context).pop();}, child: Text('Cancelar',style: TextStyle(color: color))),
        actions: [
          CupertinoActionSheetAction(onPressed: (){}, child: Text('Camera',style: TextStyle(color: color))),
          CupertinoActionSheetAction(onPressed: (){}, child: Text('Galeria',style: TextStyle(color: color))),
        ],
      );
    }

  }
}
