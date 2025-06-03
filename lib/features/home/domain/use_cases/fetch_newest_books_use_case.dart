import 'package:bookly_app/core/service/api/api_error_model.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repositories/home_repo.dart';
import 'package:bookly_app/features/home/domain/use_cases/home_use_case.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase extends HomeUseCase<List<BookEntity>, NoParam> {
  HomeRepo homeRepo;
  FetchNewestBooksUseCase(this.homeRepo);
  @override
  Future<Either<ApiErrorModel, List<BookEntity>>> execute([
    NoParam? param,
  ]) async {
    return await homeRepo.fetchNewstBooks();
  }
}
