import 'package:commons/commons.dart';
import 'package:flutter/widgets.dart';

/// common extensions in build context
extension BuildContextExtension on BuildContext {
  GoRouter get router => inject<AppRouter>().instance!;
}
