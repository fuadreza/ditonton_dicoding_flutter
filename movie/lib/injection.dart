import 'package:core/securities/http_ssl_pinning.dart';
import 'package:core/services/base_api_client.dart';
import 'package:get_it/get_it.dart';
import 'package:movie/data/datasources/db/database_helper.dart';
import 'package:movie/data/datasources/movie_local_data_source.dart';
import 'package:movie/data/datasources/movie_remote_data_source.dart';
import 'package:movie/data/repositories/movie_repository_impl.dart';
import 'package:movie/domain/repositories/movie_repository.dart';
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
import 'package:movie/presentation/pages/home_movie/blocs/now_playing/now_playing_movie_bloc.dart';
import 'package:movie/presentation/pages/home_movie/blocs/popular/popular_movie_bloc.dart';
import 'package:movie/presentation/pages/home_movie/blocs/top_rated/top_rated_movie_bloc.dart';
import 'package:movie/presentation/pages/movie_detail/blocs/detail/movie_detail_bloc.dart';
import 'package:movie/presentation/pages/movie_detail/blocs/recommendation/movie_recommendation_bloc.dart';
import 'package:movie/presentation/pages/search_movie/blocs/search_movie_bloc.dart';
import 'package:movie/presentation/pages/watchlist_movies/blocs/watchlist_movies_bloc.dart';

final locator = GetIt.instance;

void init() {
  //#region BLOC
  locator.registerFactory(
    () => NowPlayingMovieBloc(
      getNowPlayingMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => PopularMovieBloc(
      getPopularMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedMovieBloc(
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieDetailBloc(
      getMovieDetail: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieRecommendationBloc(
      getMovieRecommendations: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchListMoviesBloc(
      getWatchlistMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => SearchMovieBloc(
      searchMovies: locator(),
    ),
  );

  //#endregion BLOC

  //#region USE CASES
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatusMovie(locator()));
  locator.registerLazySingleton(() => SaveWatchlistMovie(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistMovie(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));
  //#endregion USE CASES

  //#region REPOSITORIES
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  //#endregion REPOSITORIES

  //#region DATA SOURCES
  locator.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(
      client: locator(),
    ),
  );

  locator.registerLazySingleton<MovieLocalDataSource>(
    () => MovieLocalDataSourceImpl(
      databaseHelper: locator(),
    ),
  );
  //#endregion DATA SOURCES

  //#region HELPER
  locator.registerLazySingleton<DatabaseHelper>(
    () => DatabaseHelper(),
  );
  locator.registerLazySingleton<BaseApiClient>(
    () => BaseApiClient(
      client: locator(),
    ),
  );
  //#endregion HELPER

  //#region EXTERNAL
  locator.registerLazySingleton(
    () => HttpSSLPinning.client,
  );
  //#endregion EXTERNAL
}
