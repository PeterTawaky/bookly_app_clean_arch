

import 'package:bookly_app/core/service/api/api_error_model.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<ApiErrorModel, List<BookEntity>>> fetchNewstBooks();
  Future<Either<ApiErrorModel, List<BookEntity>>> fetchFeaturedBooks();
  Future<Either<ApiErrorModel, List<BookEntity>>> fetchSimilarBooks({
    required String category,
  }); 
}