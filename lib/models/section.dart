import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_store/models/section_items.dart';

class Section{
  Section.fromDocument(DocumentSnapshot document){
    List<dynamic> list;
    id = document.id;
    name = document.get('name');
    type = document.get('type');
    list = document.get('items');
    items = list.map((e)=>SectionItem.fromMap(e)).toList();
    print(items?[0].image);

  }

  String? _id;
  String? _name;
  String? _type;
  List<SectionItem>? _items;


  String? get id => _id;

  set id(String? value) {
    _id = value;
  }

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }


  String? get type => _type;

  set type(String? value) {
    _type = value;
  }

  List<SectionItem>? get items => _items;

  set items(List<SectionItem>? value) {
    _items = value;
  }
}