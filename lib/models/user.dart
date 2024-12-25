import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserLogged extends ChangeNotifier{
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  UserLogged();
  UserLogged.firebase(User? user){
    if(user != null){
      email = user.email;
      id = user.uid;

    }

  }
  UserLogged.fromDocument(DocumentSnapshot document){
    id = document.id;
    name = document.get('name');
    email = document.get('email');
  }
  UserLogged.login({required email,required password});

  String? _id;
  String? _name;
  String? _email;
  String? _password;
  bool _admin = false;


  saveData()async {
    await _db.collection('users').doc(id).set(toMap());
  }

  Map<String,dynamic> toMap(){
    return {
      "id": id,
      "name":name,
      "email":email
    };
  }
  DocumentReference get firestoreRef => _db.collection('users').doc(id);

  CollectionReference get cartReference => firestoreRef.collection('cart');



  String? get id => _id;

  set id(String? value) {
    _id = value;
  }

  String? get name => _name;

  String? get password => _password;

  set password(String? value) {
    _password = value;
  }

  String? get email => _email;

  set email(String? value) {
    _email = value;
  }

  set name(String? value) {
    _name = value;
  }

  bool get admin => _admin;

  set admin(bool value) {
    _admin = value;
    notifyListeners();
  }
}