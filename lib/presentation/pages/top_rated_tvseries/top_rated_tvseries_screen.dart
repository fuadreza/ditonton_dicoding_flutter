import 'package:ditonton_dicoding_flutter/common/enums/list_direction.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/widgets/lists/top_rated_tvseries_list.dart';
import 'package:flutter/material.dart';

class TopRatedTvSeriesScreen extends StatelessWidget {
  const TopRatedTvSeriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Tv Series'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: TopRatedTvSeriesList(
          listDirection: ListDirection.vertical,
        ),
      ),
    );
  }
}
