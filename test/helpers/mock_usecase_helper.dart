
import 'package:movie/domain/usecases/get_movie_detail.dart';
import 'package:movie/domain/usecases/get_movie_recommendations.dart';
import 'package:movie/domain/usecases/get_now_playing_movies.dart';
import 'package:movie/domain/usecases/get_popular_movies.dart';
import 'package:movie/domain/usecases/get_top_rated_movies.dart';
import 'package:movie/domain/usecases/get_watchlist_movies.dart';
import 'package:movie/domain/usecases/get_watchlist_status_movie.dart';
import 'package:movie/domain/usecases/remove_watchlist_movie.dart';
import 'package:movie/domain/usecases/save_watchlist_movie.dart';
import 'package:movie/domain/usecases/search_movies.dart';
import 'package:mockito/annotations.dart';
import 'package:tvseries/domain/usecases/get_now_playing_tvseries.dart';
import 'package:tvseries/domain/usecases/get_popular_tvseries.dart';
import 'package:tvseries/domain/usecases/get_top_rated_tvseries.dart';
import 'package:tvseries/domain/usecases/get_tvseries_detail.dart';
import 'package:tvseries/domain/usecases/get_tvseries_recommendations.dart';
import 'package:tvseries/domain/usecases/get_watchlist_status_tvseries.dart';
import 'package:tvseries/domain/usecases/get_watchlist_tvseries.dart';
import 'package:tvseries/domain/usecases/remove_watchlist_tvseries.dart';
import 'package:tvseries/domain/usecases/save_watchlist_tvseries.dart';
import 'package:tvseries/domain/usecases/search_tvseries.dart';

@GenerateMocks([
  GetMovieDetail,
  GetMovieRecommendations,
  GetNowPlayingMovies,
  GetPopularMovies,
  GetTopRatedMovies,
  GetWatchlistMovies,
  GetWatchListStatusMovie,
  RemoveWatchlistMovie,
  SaveWatchlistMovie,
  SearchMovies,
  GetTvSeriesDetail,
  GetTvSeriesRecommendations,
  GetNowPlayingTvSeries,
  GetPopularTvSeries,
  GetTopRatedTvSeries,
  GetWatchlistTvSeries,
  GetWatchListStatusTvSeries,
  RemoveWatchlistTvSeries,
  SaveWatchlistTvSeries,
  SearchTvSeries,
])
void main() {}