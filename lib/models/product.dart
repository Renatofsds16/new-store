import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_store/models/item_size.dart';
class Product extends ChangeNotifier{
  Product();
  Product.fromDocumentSnapshot(DocumentSnapshot doc){
    id = doc.id;
    name = doc.get('name');
    description = doc.get('description');
    images = List<String>.from(doc.get('images'));
    sizes = doc.get('sizes').map((e){
      return ItemSize.fromMap(e);
    }).toList();

  }

  String? _name;
  String? _id;
  String? _description;
  List<String>? _images;
  List<dynamic>? _sizes;
  ItemSize? _selectedSize;

  int get totalStock {
    int stock = 0;
    for(ItemSize size in sizes!){
      stock += size.stock!;
    }
    print(stock);
    print('///////////////////////////////////////////************************');
    print('///////////////////////////////////////////************************');
    print('///////////////////////////////////////////************************');
    print('///////////////////////////////////////////************************');
    print('///////////////////////////////////////////************************');
    print('///////////////////////////////////////////************************');
    return stock;
  }
  ItemSize? findSize(String name){
    try {
      return sizes?.firstWhere((item)=>item.name == name);
    }catch(e){
      return null;
    }
  }

  bool get hasStock {
    return totalStock > 0;
  }



  ItemSize? get selectedSize => _selectedSize;

  set selectedSize(ItemSize? value) {
    _selectedSize = value;
    notifyListeners();
  }

  List<dynamic>? get sizes => _sizes;

  set sizes(List<dynamic>? value) {
    _sizes = value;
  }

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }

  List<String>? get images => _images;

  set images(List<String>? value) {
    _images = value;
  }

  String? get description => _description;

  set description(String? value) {
    _description = value;
  }

  String? get id => _id;

  set id(String? value) {
    _id = value;
  }
}