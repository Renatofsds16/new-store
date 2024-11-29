import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_store/models/product.dart';
import 'package:provider/provider.dart';

class ProductManager extends ChangeNotifier{
  ProductManager(){
    _loadAllProducts();
  }
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<Product> allProducts = [];
  String? _seach;

  String? get seach => _seach;

  set seach(String? value){
    _seach = value;
  }


  Future<void> _loadAllProducts()async{
    final QuerySnapshot snapshotProducts = await _db.collection('products').get();
    allProducts = snapshotProducts.docs.map((doc)=>Product.fromDocumentSnapshot(doc)).toList();
    notifyListeners();
  }
}

