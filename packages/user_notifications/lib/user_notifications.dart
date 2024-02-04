/// user notifications module
library user_notifications;

import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:user_notifications/src/views/user_notifications_screen.dart';

export 'src/core/constants.dart';

class UserNotificationsModule extends ModuleInstaller {
  UserNotificationsModule() : super(featureName: 'UserNotificationsModule');

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
            icon: const Icon(Icons.notifications_outlined),
            content: const UserNotificationsScreen(),
          ),
        );
      }
    });
  }

  @override
  List<SingleChildWidget> get rootProviders => [];
}
