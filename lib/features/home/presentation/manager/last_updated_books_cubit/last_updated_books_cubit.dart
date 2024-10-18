import 'package:bloc/bloc.dart';
import '../../../data/repos/home_repo.dart';
import 'last_updated_books_state.dart';

class LastUpdatedBooksCubit extends Cubit<LastUpdatedBooksState> {
  LastUpdatedBooksCubit(this.homeRepo) : super(LastUpdatedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> getLastedUpdatedBooks() async {
    emit(LastUpdatedBooksLoading());

    var resulte = await homeRepo.getLastUpdatedBooks();

    resulte.fold(
            (failure) => emit(LastUpdatedBooksFailure(failure.errorMessage)),
            (books) => emit(LastUpdatedBooksSuccess(books)));
  }
}
