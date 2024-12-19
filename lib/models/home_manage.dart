import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_store/models/section.dart';

class HomeManager{
  HomeManager(){
    _loadingSections();
  }
  
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Section> sections = [];


  Future<void> _loadingSections()async{
    firestore.collection('home').snapshots().listen((snapshot){
      sections.clear();
      for(DocumentSnapshot documentSnapshot in snapshot.docs){
        sections.add(Section.fromDocument(documentSnapshot));
      }
    });

  }
}