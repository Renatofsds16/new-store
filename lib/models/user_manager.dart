import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:new_store/models/user.dart';

import '../helps/erros_firebase_auth.dart';

class UserManager extends ChangeNotifier{
  UserManager(){
    _loadingCurrentUser();
  }
  UserLogged? userLogged;


  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  bool loading = false;
  bool get loggedIn => userLogged != null;

  Future<void> signIn({required UserLogged? userLogged,required Function onFail,required Function onSucess}) async {
    setLoading(true);

    try {
      if(userLogged != null){
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: userLogged.email!, password: userLogged.password!);
        userLogged.id = userCredential.user?.uid;

        await _loadingCurrentUser();
        onSucess();
      }



    }on FirebaseException catch(e){
      onFail(getErrorString(e.code));


    }
    setLoading(false);

  }
  Future<void> signUp(UserLogged user,Function onFail,Function onSuccess)async {
    print(user.email);
    print(user.password);
      setLoading(true);
      try {
        if(user.email != null || user.password != null){
          UserCredential userCredential = await _auth
              .createUserWithEmailAndPassword(email: user.email!, password: user.password!);
          user.id = userCredential.user?.uid;
          await user.saveData();
          print('voce se cadastrou no firebase');
          print('voce se cadastrou no firebase');
          print('voce se cadastrou no firebase');
          print('voce se cadastrou no firebase');
          print('voce se cadastrou no firebase');

          onSuccess();
        }
      }on FirebaseException catch(e){
        onFail();
        print(getErrorString(e.code));
        print(e.code);
      }
  }



  void setLoading(bool value){
    loading = value;
    notifyListeners();
  }
  Future<void> _loadingCurrentUser()async{
    User? user = _auth.currentUser;
    if(user != null){
     DocumentSnapshot documentSnapshot = await _db
         .collection('users')
         .doc(user.uid)
         .get();
     userLogged = UserLogged.fromDocument(documentSnapshot);
      notifyListeners();
    }
  }
  signOut()async{
    await _auth.signOut();
    userLogged = null;
    notifyListeners();
  }
}
