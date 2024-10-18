part of 'searched_books_cubit.dart';

@immutable
sealed class SearchedBooksState {}

final class SearchedBooksInitial extends SearchedBooksState {}

class SearchedBooksLoading extends SearchedBooksState {}
class SearchedBooksSuccess extends SearchedBooksState {
  final List<BookModel> books;
  SearchedBooksSuccess(this.books);
}
class SearchedBooksFailure extends SearchedBooksState {
  final String errMessage;
  SearchedBooksFailure(this.errMessage);
}