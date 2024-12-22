class SectionItem{

  SectionItem.fromMap(Map<String,dynamic> map){
    image = map['image'];
    productId = map['productId'];
  }
  String? _image;
  String? _productId;

  String? get image => _image;

  set image(String? value) {
    _image = value;
  }

  String? get productId => _productId;

  set productId(String? value) {
    _productId = value;
  }

  @override
  String toString() {
    return 'SectionItem{_image: $_image, _product: $_productId}';
  }
}
