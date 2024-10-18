import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../data/models/book_model/book_model.dart';
import 'book_rating.dart';
import 'books_action.dart';
import '../../../../../core/utils/widgets/custom_book_image.dart';

class CustomBooksDetailsSection extends StatelessWidget {
  const CustomBooksDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .17),
          child: CustomBookImage(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? ''),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          bookModel.volumeInfo.title ?? 'No Title',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: Style.textStyle30,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            'Rudyard Kipling',
            textAlign: TextAlign.center,
            style: Style.textStyle18.copyWith(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        BookRating(count: bookModel.volumeInfo.ratingsCount,rate: bookModel.volumeInfo.averageRating),
        const SizedBox(
          height: 37,
        ),
        BooksAction(bookModel: bookModel),
      ],
    );
  }
}
