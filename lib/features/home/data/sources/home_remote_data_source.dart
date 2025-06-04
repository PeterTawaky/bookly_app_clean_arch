import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  //no handling just fetch data
  Future<List<BookEntity>> fetchNewstBooks();
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchSimilarBooks({required String category});
}
