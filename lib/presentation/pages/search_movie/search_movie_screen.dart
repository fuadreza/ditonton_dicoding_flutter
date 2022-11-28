import 'package:ditonton_dicoding_flutter/common/constants.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/search_movie/blocs/search_movie_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/search_movie/widgets/lists/search_movies_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchMovieScreen extends StatelessWidget {
  const SearchMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: (query) {
                context.read<SearchMovieBloc>().searchMovieByQuery(query);
              },
              decoration: const InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            const SearchMoviesList(),
          ],
        ),
      ),
    );
  }
}
