import 'package:bookly_app/core/service/api/api_error_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeUseCase<Type, Param> {
  //generics
  Future<Either<ApiErrorModel, Type>> execute([Param param]); //optional param
}
