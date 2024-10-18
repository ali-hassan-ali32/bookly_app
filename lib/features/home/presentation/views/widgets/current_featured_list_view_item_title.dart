import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/widgets/custom_error_message.dart';
import '../../manager/featured_book_cubit/featured_book_cubit.dart';

class CurrentFeaturedListViewItemTitle extends StatelessWidget {
  const CurrentFeaturedListViewItemTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit,FeaturedBookState> (
      builder: (context, state) {
        if(state is FeaturedBookSuccess) {
          return Center(
            child: Text(
              state.books[state.currentFeaturedBook].volumeInfo.title ?? 'No Title',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Style.textStyle24.copyWith(fontFamily: kGtSectraFine),
            ),
          );
        } else if(state is FeaturedBookFailure) {
          return CustomErrorMessage(errMessage: state.errMessage);
        } else {
          return Shimmer.fromColors(
            baseColor: Colors.blueGrey[300]!,
            highlightColor: Colors.blueGrey[100]!,
            child: Center(
              child: Container(
                color: Colors.blueGrey[100],
                height: 20,
                width: 256,
              ),
            ),
          );
        }
      },
    );
  }
}
