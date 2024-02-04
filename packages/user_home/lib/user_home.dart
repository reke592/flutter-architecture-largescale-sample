/// user home module
library user_home;

import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:user_home/src/views/user_home_screen.dart';

export 'src/core/constants.dart';

class UserHomeModule extends ModuleInstaller {
  UserHomeModule() : super(featureName: 'UserHomeModule');

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
            icon: const Icon(Icons.home_rounded),
            content: const UserHomeScreen(),
          ),
        );
      }
    });
  }

  @override
  List<SingleChildWidget> get rootProviders => [];
}
