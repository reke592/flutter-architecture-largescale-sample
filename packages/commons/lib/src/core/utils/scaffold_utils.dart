import 'package:flutter/material.dart';

/// {@template ScaffoldUtils}
/// common scaffold utils
/// {@endtemplate}
class ScaffoldUtils {
  ScaffoldUtils._();

  /// show snackbar message
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showSnackBarMessage({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 2),
    DismissDirection dismissDirection = DismissDirection.down,
  }) {
    final state = ScaffoldMessenger.of(context)..removeCurrentSnackBar();
    return state.showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
        dismissDirection: dismissDirection,
      ),
    );
  }
}
