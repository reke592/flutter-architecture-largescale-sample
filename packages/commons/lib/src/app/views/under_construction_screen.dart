import 'package:flutter/material.dart';

/// {@template UnderConstructionScreen}
/// common screen for under construction features
/// {@endtemplate}
class UnderConstructionScreen extends StatelessWidget {
  /// {@macro UnderConstructionScreen}
  const UnderConstructionScreen({
    super.key,
    this.message = 'This feature is under construction.',
  });

  /// message to display
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
