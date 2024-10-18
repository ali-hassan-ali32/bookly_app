import '../../../../home/data/models/book_model/book_model.dart';

abstract class SearchRepo {
  Future<List<BookModel>> fetchSearchedBooks({required String title});
}