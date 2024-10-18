import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import '../../../data/models/book_model/book_model.dart';
import 'custom_book_details_app_bar.dart';
import 'custom_books_details_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                CustomBooksDetailsSection(bookModel: bookModel),
                const Expanded(child: SizedBox(height: 50,)),
                const SimilarBooksSection(),
                const SizedBox(height: 40,),
              ],
            ),
          ),
        )
      ],
    );
  }
}