import 'package:tvseries/injection.dart';
import 'package:tvseries/presentation/pages/search_tvseries/blocs/search_tvseries_bloc.dart';
import 'package:tvseries/presentation/pages/search_tvseries/search_tvseries_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTvSeriesPage extends StatelessWidget {
  const SearchTvSeriesPage({Key? key}) : super(key: key);

  static const routeName = '/search-tvseries';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<SearchTvSeriesBloc>(),
        ),
      ],
      child: const SearchTvSeriesScreen(),
    );
  }
}
