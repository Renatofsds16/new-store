import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_store/models/cart_product.dart';
import 'package:new_store/models/product.dart';
import 'package:new_store/models/user.dart';
import 'package:new_store/models/user_manager.dart';

class CartManager extends ChangeNotifier{
  //  esse e meu carrinho
  List<CartProduct> items = [];
  UserLogged? user;
  num productsTotalPrice = 0.0;

  void updateUser(UserManager userManager) {
    user = userManager.userLogged;
    items.clear();
    if (user != null) {
      _loadingCartItems();
    }
  }

  Future<void> _loadingCartItems() async {
    final QuerySnapshot? querySnapshot = await user?.cartReference.get();
    items = querySnapshot!.docs.map((element) {
      return CartProduct.fromDocumentSnapshot(element)..addListener(_onItemUpdate);
    }).toList();
  }

  Future<void> addToCartProduct(Product product) async{
   try {
     final e = items.firstWhere((p)=> p.stackble(product));
     e.increment();
   }catch(error){
     CartProduct cartProduct = CartProduct.fromProduct(product: product);
     cartProduct.addListener(_onItemUpdate);
     items.add(cartProduct);
     user?.cartReference.add(cartProduct.toMap()).then((value){
       cartProduct.id = value.id;
     });
     _onItemUpdate();
   }
  }
  removeOfCart(CartProduct cartProduct){
    items.removeWhere((p)=> p.id == cartProduct.id);
    user?.cartReference.doc(cartProduct.id).delete();
    cartProduct.removeListener(_onItemUpdate);
    notifyListeners();
  }

  _onItemUpdate(){
    productsTotalPrice = 0;
    for(int i=0;i<items.length;i++){
      CartProduct cartProduct = items[i];
      if(cartProduct.quantity == 0){
        removeOfCart(cartProduct);
        i--;
        continue;
      }
      productsTotalPrice += cartProduct.totalPrice;
      _updateCartProduct(cartProduct);
    }
    notifyListeners();

  }
  Future<void> _updateCartProduct(CartProduct cartProduct)async{
    if(cartProduct.id != null){
      await user?.cartReference.doc(cartProduct.id).update(cartProduct.toMap());
    }

  }
  bool get isCartValite {
    for(final cartProduct in items){
      if(!cartProduct.hasStock) return false;

    }
    return true;
  }

}
