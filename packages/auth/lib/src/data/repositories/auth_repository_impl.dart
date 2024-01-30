import 'package:auth/src/data/datasources/auth_cache_data_source.dart';
import 'package:auth/src/data/datasources/auth_remote_data_source.dart';
import 'package:auth/src/domain/auth_repository.dart';
import 'package:auth/src/domain/entities/user.dart';
import 'package:commons/commons.dart';
import 'package:flutter/widgets.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required AuthCacheDataSource cacheDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _cacheDataSource = cacheDataSource;

  final AuthRemoteDataSource _remoteDataSource;
  final AuthCacheDataSource _cacheDataSource;

  @override
  ResultFuture<User> login({
    required String username,
    required String password,
  }) async {
    try {
      final result = await _remoteDataSource.login(
        username: username,
        password: password,
      );
      return Right(result);
    } on Failure catch (_) {
      rethrow;
    } catch (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      return Left(
        UnknownFailure(
          message: '$error',
          statusCode: 'unknown',
        ),
      );
    }
  }

  @override
  ResultVoid logout(User param) async {
    try {
      final result = await _remoteDataSource.logout(param);
      return Right(result);
    } on Failure catch (_) {
      rethrow;
    } catch (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      return Left(
        UnknownFailure(
          message: '$error',
          statusCode: 'unknown',
        ),
      );
    }
  }

  @override
  ResultFuture<User> refresh() async {
    try {
      final cache = await _cacheDataSource.load();
      if (cache == null) {
        return const Left(
          CacheFailure(
            message: 'Session Expired',
            statusCode: 'cache-not-found',
          ),
        );
      }

      final result = await _remoteDataSource.refresh(cache);
      await _cacheDataSource.save(result);
      return Right(result);
    } on Failure catch (_) {
      rethrow;
    } catch (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      return Left(
        UnknownFailure(
          message: '$error',
          statusCode: 'unknown',
        ),
      );
    }
  }
}
