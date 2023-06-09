import 'package:clean_architecture_movies_app/core/exeptions/general_error.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase<T> {
  Future<Either<GeneralError, T>> call();
}


abstract class BaseUseCaseWithParameters<T, Parameters> {
  Future<Either<GeneralError, T>> call(Parameters parameters);
}
