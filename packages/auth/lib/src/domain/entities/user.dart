import 'dart:convert';

import 'package:auth/src/domain/entities/access_token.dart';
import 'package:commons/commons.dart';

part '../mappers/user.mapper.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.username,
    this.tokens = const {},
  });

  const User.empty()
      : this(
          id: '_empty.id_',
          username: '',
        );

  final String id;
  final String username;
  final Set<AccessToken> tokens;

  @override
  List<Object?> get props => [id];
}
