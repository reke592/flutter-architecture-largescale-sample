import 'package:commons/src/core/errors/failure.dart';

/// {@template CacheFailure}
/// local cache failure
/// {@endtemplate}
class CacheFailure extends Failure {
  /// {@macro CacheFailure}
  const CacheFailure({required super.message, required super.statusCode});
}
