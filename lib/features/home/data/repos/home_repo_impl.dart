import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/services/apis/apis_service.dart';
import '../models/book_model/book_model.dart';
import 'home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApisServices apisServices;
  HomeRepoImpl(this.apisServices);
  
  @override
  Future<Either<Failure, List<BookModel>>> getFearturedBooks() async {
    try {
      var data = await apisServices.get(endPoint: 'volumes?Filtering=free-ebooks&q=dark+fantasy');
      List<BookModel> books = [];
      for (var book in data['items']) {
        books.add(BookModel.fromJson(book));
      }
      return right(books);
    } catch(e) {
      if(e is DioException) {
        return left(ServerFailure.fromDioException(dioException: e));
      }else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> getLastUpdatedBooks() async {
    try {
      var data = await apisServices.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=anime');
      List<BookModel> books = [];
      for (var book in data['items']) {
        books.add(BookModel.fromJson(book));
      }
      return right(books);
    } catch(e) {
      if(e is DioException) {
        return left(ServerFailure.fromDioException(dioException: e));
      }else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> getSimilarBooks({required String category}) async {
    try {
      var data = await apisServices.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=relevance&q=dark+fantasy');
      List<BookModel> books = [];
      for (var book in data['items']) {
        books.add(BookModel.fromJson(book));
      }
      return right(books);
    } catch(e) {
      if(e is DioException) {
        return left(ServerFailure.fromDioException(dioException: e));
      }else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }

  }


}