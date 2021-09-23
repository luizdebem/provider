import 'package:flutter/material.dart';
import 'package:signup/models/UserModel.dart';

class UserService extends ChangeNotifier {
  UserModel _currentUser;

  UserModel get currentUser => _currentUser;

  void setCurrentUser(UserModel u) {
    _currentUser = u;
    notifyListeners();
  }

  void removeCurrentUser() {
    _currentUser = null;
    notifyListeners();
  }
}
