import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../features/search/presentation/views/manager/searched_books_cubit.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});


  @override
  Widget build(BuildContext context) {
    SearchedBooksCubit searchedBooksCubit = SearchedBooksCubit.get(context);
    return TextField(
      controller: searchedBooksCubit.searchController,
      onChanged: (value) {
        searchedBooksCubit.searchController.text = value;
        searchedBooksCubit.searchQuery = value;
      },
      onSubmitted: (value) {
        searchedBooksCubit.fetchSearchedBooks(searchQuery: value);
      },
      decoration: InputDecoration(
        hintText: 'Search',
        suffixIcon: IconButton(
            onPressed: () {
              searchedBooksCubit.fetchSearchedBooks(searchQuery: searchedBooksCubit.searchController.text);
            },
            icon: const Opacity(
                opacity: .7,
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 22,
                ))),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(12)));
  }
}
