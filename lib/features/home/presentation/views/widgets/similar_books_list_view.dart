import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/widgets/custom_error_message.dart';
import '../../manager/similar_books_cubit/similar_books_cubit.dart';
import '../../manager/similar_books_cubit/similar_books_state.dart';
import '../../../../../core/utils/widgets/custom_book_image.dart';

class SimilerBookListView extends StatelessWidget {
  const SimilerBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState> (
      builder: (context, state) {
        if(state is SimilarBooksSuccess) {
          return SizedBox(
            height:MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.17
                : MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: InkWell(
                    onTap: () => GoRouter.of(context).push(AppRouter.kBookDetailsViewRoute,extra: state.books[index]),
                    child: CustomBookImage(imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ?? '')),
              ),
            ),
          );
        } else if(state is SimilarBooksFailure) {
          return CustomErrorMessage(errMessage: state.errMessage,);
        } else {
          return const SimilerBooksListViewShimmer();
        }
      },
    );
  }
}
