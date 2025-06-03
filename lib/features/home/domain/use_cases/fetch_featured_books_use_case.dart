import 'package:bookly_app/core/service/api/api_error_model.dart';
import 'package:bookly_app/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);
  Future<Either<ApiErrorModel, List<dynamic>>> fetchNewstBooks() {
    //here we can check permissions
    
    return homeRepo.fetchFeaturedBooks();
  }
}
