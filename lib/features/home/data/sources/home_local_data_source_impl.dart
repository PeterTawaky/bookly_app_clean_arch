import 'package:bookly_app/core/service/api/cache/cache_key.dart';
import 'package:bookly_app/core/service/api/cache/hive_consumer.dart';
import 'package:bookly_app/features/home/data/sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    List<BookEntity> books = HiveConsumer.getData(CacheKey.featuredBooks);
    return books;
  }

  @override
  List<BookEntity> fetchNewstBooks() {
    List<BookEntity> books = HiveConsumer.getData(CacheKey.newestBooks);
    return books;
  }

  @override
  List<BookEntity> fetchSimilarBooks({required String category}) {
    // TODO: implement fetchSimilarBooks
    throw UnimplementedError();
  }
}
