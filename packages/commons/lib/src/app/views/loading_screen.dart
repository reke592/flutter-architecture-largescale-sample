import 'package:flutter/material.dart';

/// {@template LoadingScreen}
/// common screen for under construction features
/// {@endtemplate}
class LoadingScreen extends StatelessWidget {
  /// {@macro LoadingScreen}
  const LoadingScreen({
    super.key,
    this.message,
    this.loadingIndicator = const CircularProgressIndicator(),
  });

  /// optional message to display under the loading indicator
  final String? message;

  /// loading indicator
  final Widget loadingIndicator;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          loadingIndicator,
          if (message != null) Text(message!),
        ],
      ),
    );
  }
}
