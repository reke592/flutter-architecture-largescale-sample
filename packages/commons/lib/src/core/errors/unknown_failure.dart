part of 'failure.dart';

/// {@template UnknownFailure}
/// Unknown application failure
/// {@endtemplate}
class UnknownFailure extends Failure {
  /// {@macro UnknownFailure}
  const UnknownFailure({required super.message, required super.statusCode});
}
