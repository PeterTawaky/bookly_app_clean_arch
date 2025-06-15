import 'package:bookly_app/core/service/api/api_error_handler.dart';
import 'package:bookly_app/core/service/api/api_error_model.dart';
import 'package:bookly_app/features/home/data/sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/sources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });
  @override
  Future<Either<ApiErrorModel, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var localBooks = homeLocalDataSource.fetchFeaturedBooks();
      if (localBooks.isNotEmpty) {
        return Right(localBooks); //this means we have cached data
      }
      var remoteBooks = await homeRemoteDataSource.fetchFeaturedBooks();
      return Right(remoteBooks);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<ApiErrorModel, List<BookEntity>>> fetchNewstBooks() async {
    try {
      var localBooks = homeLocalDataSource.fetchNewstBooks();
      if (localBooks.isNotEmpty) {
        return Right(localBooks); //this means we have cached data
      }
      var remoteBooks = await homeRemoteDataSource.fetchNewstBooks();
      return Right(remoteBooks);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<ApiErrorModel, List<BookEntity>>> fetchSimilarBooks({
    required String category,
  }) {
    // TODO: implement fetchSimilarBooks
    throw UnimplementedError();
  }
}
