import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/book_details/presentation/views/book_details_view.dart';
import '../../Features/search/data/repositories/search_repo_impl.dart';
import '../../Features/search/presentation/manager/search_cubit/search_cubit.dart';
import '../shared/models/book_model/BookModel.dart';
import '../../Features/home/data/repositories/home_repo_impl.dart';
import '../../Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import '../../Features/home/presentation/views/home_view.dart';
import '../../Features/search/presentation/views/search_view.dart';
import '../../Features/splash/presentation/views/splash_view.dart';
import 'services_locator.dart';

abstract class AppRouter {
  static const String splash = '/';
  static const String home = '/home';
  static const String bookDetails = '/book-details';
  static const String search = '/search';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRouter.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRouter.home,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: AppRouter.bookDetails,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(
            book: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: AppRouter.search,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
          child: const SearchView(),
        ),
      ),
    ],
  );
}
