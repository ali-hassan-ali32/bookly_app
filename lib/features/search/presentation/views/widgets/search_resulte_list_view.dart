import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/widgets/books_list_view_item_shimmer.dart';
import '../../../../../core/utils/widgets/custom_error_message.dart';
import '../../../../home/presentation/views/widgets/books_list_view_item.dart';
import '../manager/searched_books_cubit.dart';


class SearchResulteListView extends StatelessWidget {
  const SearchResulteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchedBooksCubit,SearchedBooksState>(
      builder: (context, state) {
        if(state is SearchedBooksSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) => BooksListViewItem(bookModel: state.books[index]),
          );
        } else if(state is SearchedBooksFailure) {
          return CustomErrorMessage(errMessage: state.errMessage);
        } else if(state is SearchedBooksInitial) {
          return const Center(child: Text('Search For Book',style: Style.textStyle20,),);
        } else {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => const BooksListViewItemShimmer(),
          );
        }
      },
    );
  }
}
