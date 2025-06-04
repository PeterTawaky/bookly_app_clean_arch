import 'package:bookly_app/core/service/api/api_constants.dart';
import 'package:bookly_app/core/service/api/dio_consumer.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/sources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  DioConsumer dioConsumer;

  HomeRemoteDataSourceImpl(this.dioConsumer);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var response = await dioConsumer.get(
      ApiConstants.googleBooks.endpoints.volumes,
      queryParameters: {
        'q': 'robots',
        'Filtering': 'free-',
        'Sorting': 'newest',
      },
    );
    return response.map((e) => BookModel.fromJson(e)).toList();
  }

  @override
  Future<List<BookEntity>> fetchNewstBooks() async {
    var response = await dioConsumer.get(
      ApiConstants.googleBooks.endpoints.volumes,
      queryParameters: {
        'q': 'electronics',
        'Filtering': 'free-',
        'Sorting': 'newest',
      },
    );
    return response.map((e) => BookModel.fromJson(e)).toList();
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category}) async {
    var response = await dioConsumer.get(
      ApiConstants.googleBooks.endpoints.volumes,
      queryParameters: {
        'q': category,
        'Filtering': 'free-',
        'Sorting': 'newest',
      },
    );
    return response.map((e) => BookModel.fromJson(e)).toList();
  }
}
