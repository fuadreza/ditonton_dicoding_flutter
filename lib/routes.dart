import 'package:ditonton_dicoding_flutter/presentation/pages/about/about_page.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home/home_page.dart';
import 'package:movie/presentation/pages/movie_detail/movie_detail_page.dart';
import 'package:movie/presentation/pages/now_playing_movie/now_playing_movies_page.dart';
import 'package:tvseries/presentation/pages/now_playing_tvseries/now_playing_tvseries_page.dart';
import 'package:tvseries/presentation/pages/popular_tvseries/popular_tvseries_page.dart';
import 'package:movie/presentation/pages/popular_movie/popular_movies_page.dart';
import 'package:movie/presentation/pages/search_movie/search_movie_page.dart';
import 'package:tvseries/presentation/pages/search_tvseries/search_tvseries_page.dart';
import 'package:tvseries/presentation/pages/top_rated_tvseries/top_rated_tvseries_page.dart';
import 'package:tvseries/presentation/pages/tvseries_detail/tvseries_detail_page.dart';
import 'package:tvseries/presentation/pages/watchlist_tvseries/watchlist_tvseries_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/presentation/pages/top_rated_movies/top_rated_movies_page.dart';
import 'package:movie/presentation/pages/watchlist_movies/watchlist_movies_page.dart';

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case NowPlayingMoviesPage.routeName:
        return CupertinoPageRoute(builder: (_) => const NowPlayingMoviesPage());
      case NowPlayingTvSeriesPage.routeName:
        return CupertinoPageRoute(builder: (_) => const NowPlayingTvSeriesPage());
      case PopularMoviesPage.routeName:
        return CupertinoPageRoute(builder: (_) => const PopularMoviesPage());
      case PopularTvSeriesPage.routeName:
        return CupertinoPageRoute(builder: (_) => const PopularTvSeriesPage());
      case TopRatedMoviesPage.routeName:
        return CupertinoPageRoute(builder: (_) => const TopRatedMoviesPage());
      case TopRatedTvSeriesPage.routeName:
        return CupertinoPageRoute(builder: (_) => const TopRatedTvSeriesPage());
      case MovieDetailPage.routeName:
        final id = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => MovieDetailPage(id: id),
          settings: settings,
        );
      case TvSeriesDetailPage.routeName:
        final id = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => TvSeriesDetailPage(id: id),
          settings: settings,
        );
      case SearchMoviePage.routeName:
        return CupertinoPageRoute(builder: (_) => const SearchMoviePage());
      case SearchTvSeriesPage.routeName:
        return CupertinoPageRoute(builder: (_) => const SearchTvSeriesPage());
      case WatchListMoviesPage.routeName:
        return MaterialPageRoute(builder: (_) => const WatchListMoviesPage());
      case WatchListTvSeriesPage.routeName:
        return MaterialPageRoute(builder: (_) => const WatchListTvSeriesPage());
      case AboutPage.routeName:
        return MaterialPageRoute(builder: (_) => const AboutPage());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('Page not found :('),
            ),
          );
        });
    }
  }

  static Future? push<T>(String route, [T? arguments]) => state?.pushNamed(route, arguments: arguments);

  static Future? replaceWith<T>(String route, [T? arguments]) => state?.pushReplacementNamed(route, arguments: arguments);

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;
}
