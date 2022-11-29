import 'package:ditonton_dicoding_flutter/injection.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/tvseries_detail/blocs/detail/tvseries_detail_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/tvseries_detail/blocs/recommendation/tvseries_recommendation_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/tvseries_detail/tvseries_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvSeriesDetailPage extends StatelessWidget {
  const TvSeriesDetailPage({Key? key, required this.id}) : super(key: key);

  static const routeName = '/detail-tvseries';

  final int id;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<TvSeriesDetailBloc>()..getTvSeries(id),
        ),
        BlocProvider(
          create: (_) => locator<TvSeriesRecommendationBloc>()..getRecommendations(id),
        ),
      ],
      child: const TvSeriesDetailScreen(),
    );
  }
}
