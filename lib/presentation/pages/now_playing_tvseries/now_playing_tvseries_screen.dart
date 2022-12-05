import 'package:ditonton_dicoding_flutter/common/enums/list_direction.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/widgets/lists/now_playing_tvseries_list.dart';
import 'package:flutter/material.dart';

class NowPlayingTvSeriesScreen extends StatelessWidget {
  const NowPlayingTvSeriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Now Playing Tv Series'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: NowPlayingTvSeriesList(
          listDirection: ListDirection.vertical,
        ),
      ),
    );
  }
}
