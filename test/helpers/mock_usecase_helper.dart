
import 'package:ditonton_dicoding_flutter/domain/usecases/get_movie_detail.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_now_playing_movies.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_now_playing_tvseries.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_popular_movies.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_popular_tvseries.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_top_rated_movies.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_top_rated_tvseries.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_tvseries_detail.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_tvseries_recommendations.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_watchlist_movies.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_watchlist_status_movie.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_watchlist_status_tvseries.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_watchlist_tvseries.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/remove_watchlist_movie.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/remove_watchlist_tvseries.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/save_watchlist_movie.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/save_watchlist_tvseries.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/search_movies.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/search_tvseries.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  GetMovieDetail,
  GetTvSeriesDetail,
  GetMovieRecommendations,
  GetTvSeriesRecommendations,
  GetNowPlayingMovies,
  GetNowPlayingTvSeries,
  GetPopularMovies,
  GetPopularTvSeries,
  GetTopRatedMovies,
  GetTopRatedTvSeries,
  GetWatchlistMovies,
  GetWatchlistTvSeries,
  GetWatchListStatusMovie,
  GetWatchListStatusTvSeries,
  RemoveWatchlistMovie,
  RemoveWatchlistTvSeries,
  SaveWatchlistMovie,
  SaveWatchlistTvSeries,
  SearchMovies,
  SearchTvSeries,
])
void main() {}