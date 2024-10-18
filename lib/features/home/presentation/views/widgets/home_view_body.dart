import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'current_featured_list_view_item_title.dart';
import 'custom_app_bar.dart';
import 'featured_books_list_view.dart';
import 'last_updated_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              FeaturedBooksListView(),
              SizedBox(height: 20,),
              CurrentFeaturedListViewItemTitle(),
              SizedBox(height: 30,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text('Last Updated',style: Style.textStyle24,),
              ),
            ],
          ),
        ),
        LastUpdatedListView()
      ],
    );
  }
}