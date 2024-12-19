class SectionItem{

  SectionItem.fromMap(Map<String,dynamic> map){
    image = map['image'];
  }
  String? _image;

  String? get image => _image;

  set image(String? value) {
    _image = value;
  }
}
