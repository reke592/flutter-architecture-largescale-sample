import 'package:flutter/material.dart';

/// {@template AuthProvider}
/// common auth provider to expose auth state in application features
/// {@endtemplate}
class AuthProvider extends ChangeNotifier {
  bool _isAuth = false;

  /// true when user is logged in.
  ///
  /// changing this this value will trigger [notifyListeners]
  bool get isAuth => _isAuth;

  set isAuth(bool value) {
    _isAuth = value;
    notifyListeners();
  }
}
