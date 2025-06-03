import 'package:bookly_app/core/router/app_routes.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
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
        builder: (context, state) => HomeView(),
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
