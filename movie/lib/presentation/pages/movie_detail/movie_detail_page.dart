import 'package:movie/injection.dart';
import 'package:movie/presentation/pages/movie_detail/blocs/detail/movie_detail_bloc.dart';
import 'package:movie/presentation/pages/movie_detail/blocs/recommendation/movie_recommendation_bloc.dart';
import 'package:movie/presentation/pages/movie_detail/movie_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key, required this.id}) : super(key: key);

  static const routeName = '/detail';

  final int id;

  @override
  Widget build(BuildContext context) {
    print('MASHOOKK');
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<MovieDetailBloc>()..getMovie(id),
        ),
        BlocProvider(
          create: (_) => locator<MovieRecommendationBloc>()..getRecommendations(id),
        ),
      ],
      child: const MovieDetailScreen(),
    );
  }
}
