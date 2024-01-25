import 'package:commons/src/core/typedefs.dart';

/// {@template UsecaseWithParam}
/// common usecase with parameter base class
/// {@endtemplate}
abstract class UsecaseWithParam<TypeReturn, TypeParam> {
  /// {@macro UsecaseWithParam}
  const UsecaseWithParam();

  /// run usecase
  ResultFuture<TypeReturn> call(TypeParam param);
}

/// {@template UsecaseWithoutParam}
/// common usecase with parameter base class
/// {@endtemplate}
abstract class UsecaseWithoutParam<TypeReturn> {
  /// {@macro UsecaseWithoutParam}
  const UsecaseWithoutParam();

  /// run usecase
  ResultFuture<TypeReturn> call();
}
