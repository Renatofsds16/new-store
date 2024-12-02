import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_store/models/item_size.dart';

class Product{
  Product();
  Product.fromDocumentSnapshot(DocumentSnapshot doc){
    id = doc.id;
    name = doc.get('name');
    description = doc.get('description');
    images = List<String>.from(doc.get('images'));
    sizes = doc.get('size').map((e){
      return ItemSize.fromMap(e);
    }).toList();
    print(sizes);

  }
  String? _name;
  String? _id;
  String? _description;
  List<String>? _images;
  List<dynamic>? _sizes;


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