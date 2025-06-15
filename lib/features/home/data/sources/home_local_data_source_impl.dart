import 'package:bookly_app/features/home/data/sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewstBooks() {
    // TODO: implement fetchNewstBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchSimilarBooks({required String category}) {
    // TODO: implement fetchSimilarBooks
    throw UnimplementedError();
  }
}
