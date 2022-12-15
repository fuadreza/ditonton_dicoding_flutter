import 'package:tvseries/presentation/pages/watchlist_tvseries/widgets/lists/watchlist_tvseries_list.dart';
import 'package:flutter/material.dart';

class WatchListTvSeriesScreen extends StatelessWidget {
  const WatchListTvSeriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist Tv Series'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: WatchListTvSeriesList(),
      ),
    );
  }
}
