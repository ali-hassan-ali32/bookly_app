import 'package:bookly_app/core/utils/services_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/data/models/book_model/book_model.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import '../../features/home/presentation/views/book_details_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/search/presentation/data/repos/search_repo_impl.dart';
import '../../features/search/presentation/views/manager/searched_books_cubit.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeViewRoute = '/homeView';
  static const kBookDetailsViewRoute = '/bookDetailsView';
  static const kSearchViewRoute = '/searchView';

  static final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (_, state) => const SplashView(),
        ),

        GoRoute(
          path: kHomeViewRoute,
          builder: (_, state) => const HomeView(),
        ),

        GoRoute(
          path: kBookDetailsViewRoute,
          builder: (_, state) =>
              BlocProvider<SimilarBooksCubit>(
                  create: (context) =>
                      SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
                  child: BookDetailsView(bookModel: state.extra as BookModel,)),
        ),

        GoRoute(
          path: kSearchViewRoute,
          builder: (_, state) =>
              BlocProvider(
                create: (context) => SearchedBooksCubit(getIt.get<SearchRepoImpl>()),
                child: const SearchView(),
              ),
        ),

      ]
  );
}