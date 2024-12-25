import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_store/models/user.dart';
import 'package:new_store/models/user_manager.dart';

class AdminUserManager extends ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  StreamSubscription? _streamSubscription;
  late List<UserLogged> users = [];


  void updateUser(UserManager userManager) {
    _streamSubscription?.cancel();
    if (userManager.adminEnabled) {
      _listenToUsers(userManager.userLogged?.id);
    }else{
      users.clear();
      notifyListeners();
    }
  }

  _listenToUsers(String? id) async {
    _streamSubscription = _db.collection('users').snapshots().listen((snapshot) {
      users = snapshot.docs.map((e) => UserLogged.fromDocument(e)).toList();
      users.sort(
          (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));
      notifyListeners();
    });
  }

  List<String> get names => users.map((usuario) {
        String n;
        if (usuario.name != null) {
          n = usuario.name!;
          return n;
        }
        return "";
      }).toList();

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }
}
