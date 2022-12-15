import 'package:core/enums/list_direction.dart';
import 'package:tvseries/presentation/pages/home_tvseries/widgets/lists/popular_tvseries_list.dart';
import 'package:flutter/material.dart';

class PopularTvSeriesScreen extends StatelessWidget {
  const PopularTvSeriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Tv Series'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: PopularTvSeriesList(
          listDirection: ListDirection.vertical,
        ),
      ),
    );
  }
}
