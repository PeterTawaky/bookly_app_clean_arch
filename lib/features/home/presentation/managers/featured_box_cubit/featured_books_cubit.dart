import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/service/api/api_error_model.dart';
import 'package:bookly_app/features/home/data/repositories/home_repo_impl.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repositories/home_repo.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase)
    : super(FeaturedBooksInitial());

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await fetchFeaturedBooksUseCase.execute();
    result.fold(
      (failure) {
        emit(FeaturedBooksFailure(failure));
      },
      (books) {
        emit(FeaturedBooksSuccess(books));
      },
    );
  }
}
