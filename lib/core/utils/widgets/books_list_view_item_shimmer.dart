import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BooksListViewItemShimmer extends StatelessWidget {
  const BooksListViewItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.blueGrey[300]!,
      highlightColor: Colors.blueGrey[100]!,
      child: Container(
        height: 120,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.6 / 4,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blueGrey[300],
                    borderRadius: BorderRadius.circular(16)
                ),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 20,
                    color: Colors.blueGrey[300],
                  ),
                  const SizedBox(height: 5),
                  // Placeholder for author
                  Container(
                    width: MediaQuery.of(context).size.width * .32,
                    height: 16,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 20,
                        color: Colors.blueGrey[300],
                      ),
                      const Spacer(),
                      Container(
                        width: 80,
                        height: 20,
                        color: Colors.blueGrey[300],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
