import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/widgets/custom_error_message.dart';
import '../../manager/featured_book_cubit/featured_book_cubit.dart';
import '../../../../../core/utils/widgets/custom_book_image.dart';
import 'featured_books_shimmer.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookState>(
      builder: (context, state) {
        if (state is FeaturedBookSuccess) {
          return CarouselSlider.builder(
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                context.read<FeaturedBookCubit>().updateFeaturedBookIndex(index);
              },
              viewportFraction: 0.42,
              enlargeFactor: 0.22,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
            ),
            itemCount: state.books.length,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                InkWell(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRouter.kBookDetailsViewRoute,
                        extra: state.books[itemIndex],
                      );
                    },
                    child: CustomBookImage(
                      imageUrl: state.books[itemIndex].volumeInfo.imageLinks?.thumbnail ?? '',
                    )),
          );
        } else if (state is FeaturedBookFailure) {
          return CustomErrorMessage(errMessage: state.errMessage);
        } else {
          return const FeaturedBooksShimmer();
        }
      },
    );
  }
}
