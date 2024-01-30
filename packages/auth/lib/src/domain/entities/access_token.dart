import 'dart:convert';

import 'package:commons/commons.dart';

part '../mappers/access_token.mapper.dart';

class AccessToken extends Equatable {
  const AccessToken({
    required this.serviceProvider,
    required this.type,
    required this.value,
  });

  /// The name of service provider who need this token.
  ///
  /// We can use this value to map the access in cases when the application
  /// communicates to multiple backend servers,
  /// and we don't want to leak this value.
  final String serviceProvider;

  /// eg. access, refresh, etc..
  final String type;

  /// raw token string to include in HTTP request
  final String value;

  @override
  List<Object?> get props => [serviceProvider, type];
}
