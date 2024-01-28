part of '../entities/access_token.dart';

extension AccessTokenMapper on AccessToken {
  static AccessToken fromJson(String source) =>
      fromMap(jsonDecode(source) as DataMap);

  static AccessToken fromMap(DataMap map) => AccessToken(
        serviceProvider: map['serviceProvider'] as String,
        type: map['type'] as String,
        value: map['value'] as String,
      );

  AccessToken copyWith({
    String? serviceProvider,
    String? type,
    String? value,
  }) =>
      AccessToken(
        serviceProvider: serviceProvider ?? this.serviceProvider,
        type: type ?? this.type,
        value: value ?? this.value,
      );

  DataMap asMap() => {
        'serviceProvider': serviceProvider,
        'type': type,
        'value': value,
      };

  String asJson() => jsonEncode(asMap());
}
