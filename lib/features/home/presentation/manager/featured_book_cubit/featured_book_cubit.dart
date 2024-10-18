import 'package:bloc/bloc.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../data/repos/home_repo.dart';
part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.homeRepo) : super(FeaturedBookInitial());

  final HomeRepo homeRepo;

  int currentFeaturedBook = 0;

  void onFeaturedListViewMove(value) {
    currentFeaturedBook = value;
  }

  Future<void> getFeaturedBooks() async {
    emit(FeaturedBookLoading());

    var resulte = await homeRepo.getFearturedBooks();

    resulte.fold(
            (failure) => emit(FeaturedBookFailure(failure.errorMessage)),
            (books) => emit(FeaturedBookSuccess(books)));

  }

  void updateFeaturedBookIndex(int newIndex) {
    if(state is FeaturedBookSuccess) {
      final successState = state as FeaturedBookSuccess;
      emit(FeaturedBookSuccess(successState.books,currentFeaturedBook: newIndex));
    }
  }
}
