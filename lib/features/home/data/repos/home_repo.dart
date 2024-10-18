import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../models/book_model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failure,List<BookModel>>> getLastUpdatedBooks();
  Future<Either<Failure,List<BookModel>>> getFearturedBooks();
  Future<Either<Failure,List<BookModel>>> getSimilarBooks({required String category});
}