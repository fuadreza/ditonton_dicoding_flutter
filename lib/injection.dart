import 'package:ditonton_dicoding_flutter/common/services/base_api_client.dart';
import 'package:ditonton_dicoding_flutter/data/datasources/db/database_helper.dart';
import 'package:ditonton_dicoding_flutter/data/datasources/movie_local_data_source.dart';
import 'package:ditonton_dicoding_flutter/data/datasources/movie_remote_data_source.dart';
import 'package:ditonton_dicoding_flutter/data/repositories/movie_repository_impl.dart';
import 'package:ditonton_dicoding_flutter/domain/repositories/movie_repository.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_movie_detail.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_now_playing_movies.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_popular_movies.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_top_rated_movies.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_watchlist_movies.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_watchlist_status.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/remove_watchlist.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/save_watchlist.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/search_movies.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home/blocs/now_playing/now_playing_movie_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home/blocs/popular/popular_movie_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home/blocs/top_rated/top_rated_movie_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

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
  //#endregion BLOC

  //#region USE CASES
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
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
    () => http.Client(),
  );
  //#endregion EXTERNAL
}
