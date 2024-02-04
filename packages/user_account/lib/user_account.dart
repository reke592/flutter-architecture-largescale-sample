/// user account module
library user_account;

import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:user_account/src/views/user_account_screen.dart';

export 'src/core/constants.dart';

class UserAccountModule extends ModuleInstaller {
  UserAccountModule() : super(featureName: 'UserAccountModule');

  @override
  void initRoutes(AppRouter router) {}

  @override
  Future<void> initServiceContainer(GetIt inject) async {}

  @override
  void pubSub(EventBus bus) {
    bus.getBroadcast().listen((data) {
      if (data.event is InitLandingPage) {
        bus.add(
          this,
          RegisterLandingAppBarModuleNav(
            icon: const Icon(Icons.person_outline),
            content: const UserAccountScreen(),
          ),
        );
      }
    });
  }

  @override
  List<SingleChildWidget> get rootProviders => [];
}
