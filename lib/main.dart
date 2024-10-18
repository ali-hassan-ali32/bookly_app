import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/utils/app_bloc_observer.dart';
import 'core/utils/app_router.dart';
import 'core/utils/constants.dart';
import 'core/utils/services_locator.dart';
import 'features/home/data/repos/home_repo_impl.dart';
import 'features/home/presentation/manager/featured_book_cubit/featured_book_cubit.dart';
import 'features/home/presentation/manager/last_updated_books_cubit/last_updated_books_cubit.dart';

void main() {
  setupServices();
  Bloc.observer = AppBlocObserver();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FeaturedBookCubit> (
          create: (context) => FeaturedBookCubit(getIt.get<HomeRepoImpl>())..getFeaturedBooks(),
        ),
        BlocProvider<LastUpdatedBooksCubit> (
          create: (context) => LastUpdatedBooksCubit(getIt.get<HomeRepoImpl>())..getLastedUpdatedBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimalyColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
