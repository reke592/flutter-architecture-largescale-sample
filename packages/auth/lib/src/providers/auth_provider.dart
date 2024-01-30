import 'package:auth/src/domain/entities/user.dart';
import 'package:flutter/foundation.dart';

/// {@template AuthProvider}
/// common auth provider to expose auth state in application features
/// {@endtemplate}
class AuthProvider extends ChangeNotifier {
  bool _isAuth = false;
  User _user = const User.empty();

  /// changing this this value will trigger [notifyListeners]
  User get user => _user;
  set user(User? value) {
    if (value != _user) {
      _isAuth = value != null;
      _user = value ?? const User.empty();
      notifyListeners();
    }
  }

  /// true when user is not equal to [User.empty]
  bool get isAuth => _isAuth;
}
