import 'package:cloud_firestore/cloud_firestore.dart';

class Product{
  Product();
  Product.fromDocumentSnapshot(DocumentSnapshot doc){
    id = doc.id;
    name = doc.get('name');
    description = doc.get('description');
    images = List<String>.from(doc.get('images'));
    print(images);
  }
  String? _name;
  String? _id;
  String? _description;
  List<String>? _images;

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