import 'package:bookly_app/core/dependencies/service_locator.dart';
import 'package:bookly_app/core/router/app_routes.dart';
import 'package:bookly_app/core/service/api/dio_consumer.dart';
import 'package:bookly_app/features/home/data/repositories/home_repo_impl.dart';
import 'package:bookly_app/features/home/data/sources/home_local_data_source_impl.dart';
import 'package:bookly_app/features/home/data/sources/home_remote_data_source_impl.dart';
import 'package:bookly_app/features/home/domain/repositories/home_repo.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly_app/features/home/presentation/managers/featured_box_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/managers/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RouterGenerator {
  static GoRouter mainRouting = GoRouter(
    initialLocation: AppRoutes.splashView,
    //  errorBuilder: (context, state) {
    //    return Scaffold(
    //      body: Center(
    //        child: Text('No Router for this app'),
    //      ),
    //    );
    //  },
    routes: [
      GoRoute(
        name: AppRoutes.splashView,
        path: AppRoutes.splashView,
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        name: AppRoutes.homeView,
        path: AppRoutes.homeView,
        builder:
            (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create:
                      (context) => FeaturedBooksCubit(
                        FetchFeaturedBooksUseCase(getIt<HomeRepo>()),
                      ),
                ),
                BlocProvider(
                  create:
                      (context) => NewestBooksCubit(
                        FetchNewestBooksUseCase(getIt<HomeRepo>()),
                      ),
                ),
              ],
              child: HomeView(),
            ),
      ),
      GoRoute(
        name: AppRoutes.bookDetailsView,
        path: AppRoutes.bookDetailsView,
        builder: (context, state) => BookDetailsView(),
      ),
      GoRoute(
        name: AppRoutes.searchView,
        path: AppRoutes.searchView,
        builder: (context, state) => SearchView(),
      ),
    ],
  );
}
