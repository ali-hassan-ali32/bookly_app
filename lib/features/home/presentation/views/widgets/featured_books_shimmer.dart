import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FeaturedBooksShimmer extends StatelessWidget {
  const FeaturedBooksShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.blueGrey[300]!,
      highlightColor: Colors.blueGrey[100]!,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          viewportFraction: 0.42,
          enlargeFactor: 0.22,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
        ),
        itemCount: 0,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => AspectRatio(
          aspectRatio: 2.6 / 4,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey[300],
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
