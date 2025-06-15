import 'package:bookly_app/core/service/api/cache/cache_key.dart';
import 'package:bookly_app/features/home/data/sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box =
        Hive.box<BookEntity>(
          CacheKey.featuredBooks,
        ).values; //iterable collection
    return box.toList();
  }

  @override
  List<BookEntity> fetchNewstBooks() {
    var box =
        Hive.box<BookEntity>(CacheKey.newestBooks).values; //iterable collection
    return box.toList();
  }

  @override
  List<BookEntity> fetchSimilarBooks({required String category}) {
    // TODO: implement fetchSimilarBooks
    throw UnimplementedError();
  }
}
