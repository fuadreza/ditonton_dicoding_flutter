import 'package:ditonton_dicoding_flutter/presentation/pages/about/about_page.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home/home_movie_page.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/movie_detail/movie_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'presentation/pages/popular_movie/popular_movies_page.dart';
import 'presentation/pages/top_rated_movies/top_rated_movies_page.dart';

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeMoviePage());
      case PopularMoviesPage.routeName:
        return CupertinoPageRoute(builder: (_) => const PopularMoviesPage());
      case TopRatedMoviesPage.routeName:
        return CupertinoPageRoute(builder: (_) => const TopRatedMoviesPage());
      case MovieDetailPage.routeName:
        final id = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => MovieDetailPage(id: id),
          settings: settings,
        );
      // case SearchPage.ROUTE_NAME:
      //   return CupertinoPageRoute(builder: (_) => SearchPage());
      // case WatchlistMoviesPage.ROUTE_NAME:
      //   return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
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
