import 'package:get_it/get_it.dart';

/// GetIt service container extensions
extension GetItExtension on GetIt {
  /// unregister [T] then registerLazySingleton
  void injectOverrideLazySingleton<T extends Object>(T Function() factoryFunc) {
    GetIt.I
      ..unregister<T>()
      ..registerLazySingleton(factoryFunc);
  }

  /// unregister [T] then registerFactory
  void injectOverrideFactory<T extends Object>(T Function() factoryFunc) {
    GetIt.I
      ..unregister<T>()
      ..registerFactory(factoryFunc);
  }
}

/// common injection container
final inject = GetIt.I;
