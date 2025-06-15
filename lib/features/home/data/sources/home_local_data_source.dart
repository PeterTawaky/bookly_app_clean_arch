import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  //no handling just fetch data
  List<BookEntity> fetchNewstBooks();
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchSimilarBooks({required String category});
}
