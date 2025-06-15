import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/service/api/api_error_model.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await fetchNewestBooksUseCase.execute();
    result.fold(
      (failure) {
        emit(NewestBooksFailure(failure));
      },
      (books) {
        emit(NewestBooksSuccess(books));
      },
    );
  }
}
