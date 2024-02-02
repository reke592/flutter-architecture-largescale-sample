import 'dart:async';

import 'package:commons/commons.dart';
import 'package:flutter/material.dart';

part 'app_bar_nav_event.dart';
part 'app_bar_nav_state.dart';

class AppBarNavBloc extends Bloc<AppBarNavEvent, AppBarNavState> {
  AppBarNavBloc({
    required EventBus eventBus,
  })  : _pub = eventBus,
        super(AppBarNavInitial()) {
    on<InitializeLandingAppBar>(_onInitializeLandingAppBar);
    on<RegisterAppBarNav>(_onRegisterAppBarNav);
    _sub = eventBus.getBroadcast().listen(_onPubSubEvent);
  }

  final EventBus _pub;
  late final StreamSubscription<EventBusData> _sub;

  @override
  Future<void> close() async {
    await _sub.cancel();
    return super.close();
  }

  void _onPubSubEvent(EventBusData data) {
    if (data.event is RegisterLandingAppBarModuleNav) {
      final event = data.event as RegisterLandingAppBarModuleNav;
      add(
        RegisterAppBarNav(
          icon: event.icon,
          content: event.content,
          index: event.index,
          label: event.label,
        ),
      );
    }
  }

  FutureOr<void> _onInitializeLandingAppBar(
    InitializeLandingAppBar event,
    Emitter<AppBarNavState> emit,
  ) {
    _pub.add(this, InitLandingPage());
  }

  FutureOr<void> _onRegisterAppBarNav(
    RegisterAppBarNav event,
    Emitter<AppBarNavState> emit,
  ) {
    emit(
      AppBarNavRegistered(
        icon: event.icon,
        content: event.content,
        label: event.label,
        index: event.index,
      ),
    );
  }
}
