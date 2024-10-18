import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, this.mainAxisAlignment = MainAxisAlignment.center, required this.rate, required this.count});
  final MainAxisAlignment mainAxisAlignment;
  final num? rate;
  final int? count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(width: 6.3),
        Text(
          '${rate ?? 'N/A'}',
          style: Style.textStyle16,
        ),
        const SizedBox(width: 5,),
        Opacity(
          opacity: 0.5,
          child: Text(
            '(${count ?? 0})',
            style: Style.textStyle14.copyWith(fontWeight: FontWeight.w600)),
          ),
      ],
    );
  }
}
