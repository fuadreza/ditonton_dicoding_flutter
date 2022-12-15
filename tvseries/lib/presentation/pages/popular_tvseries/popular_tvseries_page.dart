import 'package:tvseries/injection.dart';
import 'package:tvseries/presentation/pages/home_tvseries/blocs/popular/popular_tvseries_bloc.dart';
import 'package:tvseries/presentation/pages/popular_tvseries/popular_tvseries_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularTvSeriesPage extends StatelessWidget {
  const PopularTvSeriesPage({Key? key}) : super(key: key);

  static const routeName = '/popular-tvseries';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<PopularTvSeriesBloc>()..getPopular(),
        ),
      ],
      child: const PopularTvSeriesScreen(),
    );
  }
}
