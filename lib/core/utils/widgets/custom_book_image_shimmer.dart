import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class CustomBookImageShimmer extends StatelessWidget {
  const CustomBookImageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.blueGrey[300]!,
      highlightColor: Colors.blueGrey[100]!,
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey[300],
            borderRadius: BorderRadius.circular(16)
          ),
        ),
      ),
    );
  }
}
