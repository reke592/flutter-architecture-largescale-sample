import 'dart:developer';

import 'package:rxdart/rxdart.dart';

class PubSubEvent {
  PubSubEvent({
    required this.sender,
    required this.event,
  });

  final Object sender;
  final Object event;
}

/// common PubSub event bus
class EventBus {
  final _eventStream = PublishSubject<PubSubEvent>();

  /// broadcast stream to listen
  Stream<PubSubEvent> getBroadcast() => _eventStream.asBroadcastStream();

  /// publish event to broadcast
  void add(Object sender, Object event) {
    log('EventBus: sender: ${sender.runtimeType}, event: $event');
    _eventStream.add(
      PubSubEvent(
        event: event,
        sender: sender,
      ),
    );
  }
}
