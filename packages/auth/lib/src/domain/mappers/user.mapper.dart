part of '../entities/user.dart';

extension UserMapper on User {
  static User fromJson(String source) => fromMap(jsonDecode(source) as DataMap);

  static User fromMap(DataMap map) => User(
        id: map['id'] as String,
        username: map['username'] as String,
        tokens: List<DataMap>.from(map['tokens'] as List? ?? [])
            .map(AccessTokenMapper.fromMap)
            .toSet(),
      );

  User copyWith({
    String? id,
    String? username,
    Set<AccessToken>? tokens,
  }) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        tokens: tokens ?? this.tokens,
      );

  DataMap asMap() => {
        'id': id,
        'username': username,
        'tokens': tokens.toList(),
      };

  String asJson() => jsonEncode(asMap());
}
