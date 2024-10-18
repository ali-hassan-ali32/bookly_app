part of 'featured_book_cubit.dart';

abstract class FeaturedBookState {}

class FeaturedBookInitial extends FeaturedBookState {}

class FeaturedBookLoading extends FeaturedBookState {}

class FeaturedBookSuccess extends FeaturedBookState {
  final List<BookModel> books;
  final int currentFeaturedBook;

  FeaturedBookSuccess(this.books,{this.currentFeaturedBook = 0});
}

class FeaturedBookFailure extends FeaturedBookState {
  final String errMessage;
  FeaturedBookFailure(this.errMessage);
}
