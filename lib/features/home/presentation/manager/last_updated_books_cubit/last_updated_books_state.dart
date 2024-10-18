import '../../../data/models/book_model/book_model.dart';

abstract class LastUpdatedBooksState {}

class LastUpdatedBooksInitial extends LastUpdatedBooksState {}

class LastUpdatedBooksLoading extends LastUpdatedBooksState {}

class LastUpdatedBooksSuccess extends LastUpdatedBooksState {
  final List<BookModel> books;
  LastUpdatedBooksSuccess(this.books);
}

class LastUpdatedBooksFailure extends LastUpdatedBooksState {
  final String errMessage;
  LastUpdatedBooksFailure(this.errMessage);
}

