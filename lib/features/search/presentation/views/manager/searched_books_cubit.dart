import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import '../../../../home/data/models/book_model/book_model.dart';
import '../../data/repos/search_repo.dart';
part 'searched_books_state.dart';

class SearchedBooksCubit extends Cubit<SearchedBooksState> {
  SearchedBooksCubit(this.searchRepo) : super(SearchedBooksInitial());

  final SearchRepo searchRepo;

  static SearchedBooksCubit get(context) => BlocProvider.of(context);

  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }

  void clearSearch() {
    searchQuery = '';
    searchController.clear();
    emit(SearchedBooksInitial());
  }

  Future<void> fetchSearchedBooks({required String searchQuery}) async {
    emit(SearchedBooksLoading());
    try {
      List<BookModel> books = await searchRepo.fetchSearchedBooks(title: searchQuery);
      if(searchQuery.isEmpty || searchController.text.isEmpty) {
        emit(SearchedBooksInitial());
      }
      emit(SearchedBooksSuccess(books));
    } catch (e) {
      if(searchQuery.isEmpty || searchController.text.isEmpty) {
        emit(SearchedBooksInitial());
      } else {
        emit(SearchedBooksFailure('The Book not Found'));

      }
    }
  }
}
