import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/widgets/custom_book_image_shimmer.dart';

class SimilerBooksListViewShimmer extends StatelessWidget {
  const SimilerBooksListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.blueGrey[300]!,
      highlightColor: Colors.blueGrey[100]!,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .15,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: CustomBookImageShimmer(),
          ),
        ),
      ),
    );
  }
}
