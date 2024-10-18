import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/widgets/books_list_view_item_shimmer.dart';
import '../../../../../core/utils/widgets/custom_error_message.dart';
import '../../manager/last_updated_books_cubit/last_updated_books_cubit.dart';
import '../../manager/last_updated_books_cubit/last_updated_books_state.dart';
import 'books_list_view_item.dart';

class LastUpdatedListView extends StatelessWidget {
  const LastUpdatedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LastUpdatedBooksCubit,LastUpdatedBooksState> (
      builder: (context, state) {
        if(state is LastUpdatedBooksSuccess) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) => BooksListViewItem(bookModel: state.books[index]),
                childCount: state.books.length,
              ),
            ),
          );
        } else if(state is LastUpdatedBooksFailure) {
          return SliverToBoxAdapter(child: CustomErrorMessage(errMessage: state.errMessage));
        } else {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) => const BooksListViewItemShimmer(),
                childCount: 10,
              ),
            ),
          );
        }
      },
    );
  }
}
