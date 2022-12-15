import 'package:core/constants.dart';
import 'package:tvseries/presentation/pages/search_tvseries/blocs/search_tvseries_bloc.dart';
import 'package:tvseries/presentation/pages/search_tvseries/widgets/lists/search_tvseries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTvSeriesScreen extends StatelessWidget {
  const SearchTvSeriesScreen({Key? key}) : super(key: key);

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
                context.read<SearchTvSeriesBloc>().searchTvSeriesByQuery(query);
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
            const SearchTvSeriesList(),
          ],
        ),
      ),
    );
  }
}
