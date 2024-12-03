class ItemSize{
  ItemSize.fromMap(Map<String,dynamic> map){
    name = map['name'];
    price = map['price'];
    stock = map['stock'];
  }


  bool get hasStock => stock! > 0;


  @override
  String toString() {
    return 'ItemSize{_name: $_name, _price: $_price, _stock: $_stock}';
  }

  String? _name;
  double? _price;
  int? _stock;

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }

  double? get price => _price;

  int? get stock => _stock;

  set stock(int? value) {
    _stock = value;
  }

  set price(double? value) {
    _price = value;
  }
}