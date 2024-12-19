import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:new_store/models/item_size.dart';
import 'package:new_store/models/product.dart';

class CartProduct extends ChangeNotifier{
  CartProduct.fromProduct({required this.product }){
    idProduct = product?.id;
    size = product?.selectedSize?.name;
    quantity = 1;
  }
  CartProduct.fromDocumentSnapshot(DocumentSnapshot documentSnapshot){
    id = documentSnapshot.id;
    idProduct = documentSnapshot.get('pid');
    size = documentSnapshot.get('size');
    quantity = documentSnapshot.get('quantity');
    firebaseFirestore.collection('products').doc(idProduct).get().then(
        (element){
          product = Product.fromDocumentSnapshot(element);
          notifyListeners();

        }

    );
  }
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String? _id;
  String? _size;
  String? _idProduct;
  int _quantity = 0;


  ItemSize? get itemSize{
   if(product != null){
     return product?.findSize(size!);
   }
   return null;
  }
  Map<String,dynamic> toMap(){
    Map<String,dynamic> map = {};
    map['pid'] = idProduct;
    map['quantity'] = quantity;
    map['size'] = size;

    return map;

  }
  bool stackble(product){
    return product.id == idProduct && product.selectedSize.name == size;
  }

  double? get unitPrice{
    if(product != null){
      return itemSize?.price;
    }
    return 0.0;
  }
  num get totalPrice {
    return unitPrice! * quantity;
  }

  String? get size => _size;

  set size(String? value) {
    _size = value;
  }

  Product? product;

  String? get idProduct => _idProduct;

  set idProduct(String? value) {
    _idProduct = value!;
    }
    int get quantity => _quantity;

  set quantity(int value) {
    _quantity = value;
  }
  increment(){
    quantity++;
    notifyListeners();
  }
  decrement(){
    quantity--;
    notifyListeners();
  }
  bool get hasStock {
    final size = itemSize;
    if(size == null) return false;
    return size.stock! >= quantity;

  }

  String? get id => _id;

  set id(String? value) {
    _id = value;
    notifyListeners();
  }

}