import 'package:auth/auth.dart';
import 'package:commons/commons.dart';
import 'package:customs/customs.dart';
import 'package:flutter/material.dart';
import 'package:largescale/src/landing/bloc/app_bar_nav_bloc.dart';
import 'package:largescale/src/landing/views/landing_screen.dart';
import 'package:user_account/user_account.dart';
import 'package:user_home/user_home.dart';
import 'package:user_notifications/user_notifications.dart';

part 'bootstrap.main.dart';

// application standard features
final appModules = <ModuleInstaller>[
  Auth(),
  UserHomeModule(),
  UserNotificationsModule(),
  UserAccountModule(),
];
