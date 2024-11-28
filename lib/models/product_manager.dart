import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_store/models/product.dart';
import 'package:provider/provider.dart';

class ProductManager extends ChangeNotifier{
  ProductManager(){
    _loadAllProducts();
  }
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<Product> _allProducts = [];


  Future<void> _loadAllProducts()async{
    final QuerySnapshot snapshotProducts = await _db.collection('products').get();
    _allProducts = snapshotProducts.docs.map((doc)=>Product.fromDocumentSnapshot(doc)).toList();
    notifyListeners();
  }
}

