import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:new_store/models/user.dart';

import '../helps/erros_firebase_auth.dart';

class UserManager extends ChangeNotifier{
  UserManager(){
    _loadingCurrentUser();
  }
  User? _user;
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;

  Future<void> signIn({required UserLogged userLogged,required Function onFail}) async {
    setLoading(true);
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: userLogged.email, password: userLogged.password);
      _user = result.user;

    }on FirebaseException catch(e){
      onFail(getErrorString(e.code));


    }
    setLoading(false);

  }
  void setLoading(bool value){
    loading = value;
    notifyListeners();
  }
  _loadingCurrentUser()async{
    User? user = auth.currentUser;
    if(user != null){
      _user = user;
      print(_user?.uid);
      print('/*************************************////////////////////**********');
      notifyListeners();
    }
  }
}
