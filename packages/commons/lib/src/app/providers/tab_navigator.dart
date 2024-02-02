import 'package:flutter/material.dart';

class TabNavItem {
  TabNavItem({
    required this.content,
    required this.icon,
  });

  final Widget content;
  final Widget icon;
  final navigatorState = GlobalKey<NavigatorState>();
}

/// {@template TabNavigator}
/// common ui tab navigator state
/// {@endtemplate}
// TODO(TabNavigator): create tab navigator.
class TabNavigator extends ChangeNotifier {
  final List<TabNavItem> tabs = [];

  int _index = 0;

  /// current selected index
  int get index => _index;

  /// setting this value will trigger [notifyListeners]
  set index(int value) {
    if (index != value) {
      _index = value;
      notifyListeners();
    }
  }

  /// [TabNavItem.content]
  Widget get currentView => tabs[_index].content;

  /// [TabNavItem.navigatorState]
  GlobalKey<NavigatorState> get state => tabs[_index].navigatorState;

  /// register new [TabNavItem]
  void registerTab(
    TabNavItem value, {
    int index = 0,
    bool notify = false,
  }) {
    tabs.insert(index, value);
    if (notify) {
      notifyListeners();
    }
  }
}
