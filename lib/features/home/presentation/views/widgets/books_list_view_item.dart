import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/book_model/book_model.dart';
import 'book_rating.dart';
import '../../../../../core/utils/widgets/custom_book_image.dart';

class BooksListViewItem extends StatelessWidget {
  const BooksListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context).push(AppRouter.kBookDetailsViewRoute,extra: bookModel),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 120,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            CustomBookImage(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? ''),
            const SizedBox(width: 30,),
            SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookModel.volumeInfo.title ?? 'No Title',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Style.textStyle20.copyWith(fontFamily: kGtSectraFine),
                  ),
                  const SizedBox(height: 3,),
                  Text(
                    bookModel.volumeInfo.authors?[0] ?? 'No Aurther',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Style.textStyle14,
                  ),
                  const SizedBox(height: 3,),
                  Row(
                    children: [
                      Text(
                         'Free',
                        style: Style.textStyle18.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      BookRating(rate: bookModel.volumeInfo.averageRating,count: bookModel.volumeInfo.ratingsCount,)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



