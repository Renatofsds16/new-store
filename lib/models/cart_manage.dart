import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_store/models/cart_product.dart';
import 'package:new_store/models/product.dart';
import 'package:new_store/models/user.dart';
import 'package:new_store/models/user_manager.dart';

class CartManager {
  //  esse e meu carrinho
  List<CartProduct> items = [];
  UserLogged? user;

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
      return CartProduct.fromDocumentSnapshot(element);
    }).toList();
  }

  void addToCartProduct(Product product) {
    items.add(CartProduct.fromProduct(product: product));
    print(items);
  }
}
