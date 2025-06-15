import 'package:bookly_app/core/service/api/dio_consumer.dart';
import 'package:bookly_app/features/home/data/repositories/home_repo_impl.dart';
import 'package:bookly_app/features/home/data/sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/sources/home_local_data_source_impl.dart';
import 'package:bookly_app/features/home/data/sources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/data/sources/home_remote_data_source_impl.dart';
import 'package:bookly_app/features/home/domain/repositories/home_repo.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<DioConsumer>(() => DioConsumer());
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(getIt<DioConsumer>()),
  );
  getIt.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(),
  );
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(
      homeRemoteDataSource: getIt<HomeRemoteDataSource>(),
      homeLocalDataSource: getIt<HomeLocalDataSource>(),
    ),
  );
}
