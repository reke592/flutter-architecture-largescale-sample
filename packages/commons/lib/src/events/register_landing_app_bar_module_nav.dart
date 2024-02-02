import 'package:flutter/material.dart';

class RegisterLandingAppBarModuleNav {
  RegisterLandingAppBarModuleNav({
    required this.icon,
    required this.content,
    this.label,
    this.index = 0,
  });

  final Widget icon;
  final Widget content;
  final Widget? label;
  final int index;
}
