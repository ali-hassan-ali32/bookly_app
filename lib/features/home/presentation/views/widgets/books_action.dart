import 'package:flutter/material.dart';
import '../../../../../core/utils/functions/custom_url_launcher.dart';
import '../../../../../core/utils/widgets/custom_buttom.dart';
import '../../../data/models/book_model/book_model.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
              child: CustomButtom(
                text: 'Free',
                backgroundColor: Colors.white,
                textColor: Colors.black,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12)),
          )),
          Expanded(
              child: CustomButtom(
                onPressed: () async {
                 customUrlLauncher(context, bookModel.volumeInfo.previewLink);
                },
                fontSize: 15,
                text: isBookAvailable(bookModel),
                backgroundColor: const Color(0xffEF8262),
                textColor: Colors.white,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
          )),
        ],
      ),
    );
  }

  String isBookAvailable(BookModel bookModel) {
    if((bookModel.volumeInfo.previewLink != null)) {
      return 'Free Overview';
    } else {
      return 'Not Available';
    }
  }
}