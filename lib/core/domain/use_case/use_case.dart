import 'package:dartz/dartz.dart';
import 'package:flutter_task/core/domain/entities/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {
  const NoParams();
}
