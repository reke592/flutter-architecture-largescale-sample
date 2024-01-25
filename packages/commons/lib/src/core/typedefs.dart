import 'package:commons/src/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

/// common type definition for JSON Object
typedef DataMap = Map<String, dynamic>;

/// common type definition for future result using dartz [Either]
typedef ResultFuture<T> = Future<Either<Failure, T>>;

/// common type definition for future void result using dartz [Either]
typedef ResultVoid<T> = ResultFuture<void>;
