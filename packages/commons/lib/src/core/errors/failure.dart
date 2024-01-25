import 'package:equatable/equatable.dart';

/// {@template failure}
/// common failure base class
/// {@endtemplate}
abstract class Failure extends Equatable {
  /// {@macro failure}
  const Failure({
    required this.message,
    required this.statusCode,
  });

  /// failure message
  final String message;

  /// failure status code
  final dynamic statusCode;

  /// formatted failure message
  String get failureMessage =>
      '$statusCode ${statusCode is int ? 'Error' : ''} : $message';

  @override
  List<Object?> get props => [message, statusCode];
}
