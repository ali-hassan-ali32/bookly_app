import 'package:bookly_app/features/search/presentation/views/widgets/search_resulte_list_view.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../../core/utils/styles.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(),
          SizedBox(height: 16,),
          Text('Resulte',style: Style.textStyle18,),
          SizedBox(height: 16,),
          Expanded(child: SearchResulteListView()),
        ],
      ),
    );
  }
}
