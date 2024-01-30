import 'package:auth/src/core/constants.dart';
import 'package:auth/src/data/datasources/auth_cache_data_source.dart';
import 'package:auth/src/domain/entities/user.dart';
import 'package:commons/commons.dart';

class AuthCacheDataSourceImpl extends AuthCacheDataSource {
  AuthCacheDataSourceImpl(this._storage);

  final SharedPreferences _storage;

  @override
  Future<User?> load() async {
    await _storage.reload();
    final source = _storage.getString(kAuthUserCacheName);
    if (source == null) return null;
    return UserMapper.fromJson(source);
  }

  @override
  Future<void> save(User data) async {
    await _storage.setString(kAuthUserCacheName, data.asJson());
  }
}
