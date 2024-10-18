import 'package:bookly_app/features/search/presentation/data/repos/search_repo.dart';
import 'package:dio/dio.dart';

import '../../../../../core/services/apis/apis_service.dart';
import '../../../../home/data/models/book_model/book_model.dart';

class SearchRepoImpl extends SearchRepo {
  final ApisServices apisServices;
  SearchRepoImpl(this.apisServices);
  
  @override
  Future<List<BookModel>> fetchSearchedBooks({required String title}) async {
    try {
      var data = await apisServices.get(endPoint: 'volumes?Filtering=free-ebooks&q=$title');
      List<BookModel> books = [];
      for (var book in data['items']) {
        books.add(BookModel.fromJson(book));
      }

      return books;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'opps there was and error, try later';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('opps there was and error, try later');
    }
  }

}