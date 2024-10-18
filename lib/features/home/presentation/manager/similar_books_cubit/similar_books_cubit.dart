import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_state.dart';
import '../../../data/repos/home_repo.dart';


class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());


  final HomeRepo homeRepo;

  Future<void> getSimailarBooks({required String category}) async {
    emit(SimilarBooksLoading());

    var resulte = await homeRepo.getSimilarBooks(category: category);

    resulte.fold(
            (failure) => emit(SimilarBooksFailure(failure.errorMessage)),
            (books) => emit(SimilarBooksSuccess(books)));
  }
}
