part of 'failure.dart';

/// {@template ApiFailure}
/// remote API failure
/// {@endtemplate}
class APIFailure extends Failure {
  /// {@macro ApiFailure}
  const APIFailure({required super.message, required super.statusCode});
}
