import 'package:commons/commons.dart';
import 'package:flutter/widgets.dart';

/// common extensions in build context
extension BuildContextExtension on BuildContext {
  AppRouter get router => inject<AppRouter>();
}
