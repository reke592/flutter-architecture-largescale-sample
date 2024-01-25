import 'package:commons/src/core/errors/failure.dart';
import 'package:flutter/material.dart';

/// {@template DialogUtils}
/// common dialog utils
/// {@endtemplate}
class DialogUtils {
  DialogUtils._();

  /// dispay error message dialog
  static Future<void> showError(BuildContext context, dynamic error) async {
    return showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          content: Text(
            error is Failure ? error.failureMessage : '$error',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  /// dispay confirm message dialog
  static Future<bool> confirm(
    BuildContext context,
    String message, {
    String no = 'No',
    String yes = 'Yes',
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext, false);
              },
              child: Text(no),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext, true);
              },
              child: Text(yes),
            ),
          ],
        );
      },
    );

    return result ?? false;
  }
}
