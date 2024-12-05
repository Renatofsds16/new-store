import 'package:new_store/models/product.dart';

class CartProduct{
  CartProduct.fromProduct({required this.product }){
    idProduct = product?.id;
    size = product?.selectedSize?.name;
    quantity = 1;
  }

  String? _size;
  String? _idProduct;
  int? _quantity;


  String? get size => _size;

  set size(String? value) {
    _size = value;
  }

  Product? product;

  String? get idProduct => _idProduct;

  set idProduct(String? value) {
    _idProduct = value!;
  }

  int? get quantity => _quantity;

  set quantity(int? value) {
    _quantity = value;
  }
}