import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// {@template AppRouter}
/// common ui router
/// {@endtemplate}
class AppRouter {
  AppRouter();

  /// registry for all route base
  final Map<String, RouteBase> _routeRegistry = {};

  /// router root navigator
  final rootNavigatorKey = GlobalKey<NavigatorState>();

  /// router instance
  GoRouter? instance;

  /// register and create route base object
  RouteBase createRoute({
    required String uniqueName,
    required String path,
    bool override = false,
    Widget Function(BuildContext, GoRouterState)? builder,
    Page<dynamic> Function(BuildContext, GoRouterState)? pageBuilder,
    GlobalKey<NavigatorState>? parentNavigatorKey,
    FutureOr<String?> Function(BuildContext, GoRouterState)? redirect,
    List<RouteBase> routes = const <RouteBase>[],
  }) {
    assert(
      !_routeRegistry.containsKey(uniqueName) || override,
      '$uniqueName already registered.',
    );

    if (override) {
      debugPrint(
        '${_routeRegistry.containsKey(uniqueName) ? 'overriding' : 'register'} '
        'route name: $uniqueName',
      );
    }

    _routeRegistry[uniqueName] = GoRoute(
      path: path,
      name: uniqueName,
      builder: builder,
      pageBuilder: pageBuilder,
      parentNavigatorKey: rootNavigatorKey,
      redirect: redirect,
      routes: routes,
    );

    return _routeRegistry[uniqueName]!;
  }

  /// wrapper method to create nested route base object [ShellRoute]
  RouteBase nestedRoute({
    required List<RouteBase> routes,
    Widget Function(BuildContext, GoRouterState, Widget)? builder,
    Page<dynamic> Function(BuildContext, GoRouterState, Widget)? pageBuilder,
    List<NavigatorObserver>? observers,
    GlobalKey<NavigatorState>? parentNavigatorKey,
    GlobalKey<NavigatorState>? navigatorKey,
    String? restorationScopeId,
  }) {
    assert(
      builder != null && pageBuilder != null,
      'either builder or pageBuilder is required',
    );

    return ShellRoute(
      builder: builder,
      pageBuilder: pageBuilder,
      parentNavigatorKey: parentNavigatorKey ?? rootNavigatorKey,
      navigatorKey: navigatorKey ?? GlobalKey<NavigatorState>(),
      observers: observers,
      routes: routes,
      restorationScopeId: restorationScopeId,
    );
  }

  /// build router object
  RouterConfig<Object> build({
    String initialRoute = '/',
  }) {
    return instance = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: initialRoute,
      routes: _routeRegistry.values.toList(),
    );
  }

  /// wrapper method for router goNamed
  void goNamed(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    instance!.goNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  /// wrapper method for router pushNamed
  Future<T?> pushNamed<T extends Object?>(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    return instance!.pushNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  /// wrapper method for router pushNamed
  Future<T?> pushReplacementNamed<T extends Object?>(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    return instance!.pushReplacementNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }
}
