import 'package:core/services/base_api_client.dart';
import 'package:tvseries/data/datasources/db/database_helper.dart';
import 'package:tvseries/data/datasources/tvseries_local_data_source.dart';
import 'package:tvseries/data/datasources/tvseries_remote_data_source.dart';
import 'package:tvseries/data/repositories/tvseries_repository_impl.dart';
import 'package:tvseries/domain/repositories/tvseries_repository.dart';
import 'package:tvseries/domain/usecases/get_now_playing_tvseries.dart';
import 'package:tvseries/domain/usecases/get_popular_tvseries.dart';
import 'package:tvseries/domain/usecases/get_top_rated_tvseries.dart';
import 'package:tvseries/domain/usecases/get_tvseries_detail.dart';
import 'package:tvseries/domain/usecases/get_tvseries_recommendations.dart';
import 'package:tvseries/domain/usecases/get_tvseries_season_detail.dart';
import 'package:tvseries/domain/usecases/get_watchlist_status_tvseries.dart';
import 'package:tvseries/domain/usecases/get_watchlist_tvseries.dart';
import 'package:tvseries/domain/usecases/remove_watchlist_tvseries.dart';
import 'package:tvseries/domain/usecases/save_watchlist_tvseries.dart';
import 'package:tvseries/domain/usecases/search_tvseries.dart';
import 'package:tvseries/presentation/pages/home_tvseries/blocs/now_playing/now_playing_tvseries_bloc.dart';
import 'package:tvseries/presentation/pages/home_tvseries/blocs/popular/popular_tvseries_bloc.dart';
import 'package:tvseries/presentation/pages/home_tvseries/blocs/top_rated/top_rated_tvseries_bloc.dart';
import 'package:tvseries/presentation/pages/search_tvseries/blocs/search_tvseries_bloc.dart';
import 'package:tvseries/presentation/pages/tvseries_detail/blocs/detail/tvseries_detail_bloc.dart';
import 'package:tvseries/presentation/pages/tvseries_detail/blocs/recommendation/tvseries_recommendation_bloc.dart';
import 'package:tvseries/presentation/pages/tvseries_detail/blocs/season/tvseries_detail_season_bloc.dart';
import 'package:tvseries/presentation/pages/watchlist_tvseries/blocs/watchlist_tvseries_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  //#region BLOC
  locator.registerFactory(
    () => NowPlayingTvSeriesBloc(
      getNowPlayingTvSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => PopularTvSeriesBloc(
      getPopularTvSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedTvSeriesBloc(
      getTopRatedTvSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesDetailBloc(
      getTvSeriesDetail: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchListTvSeriesBloc(
      getWatchlistTvSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => SearchTvSeriesBloc(
      searchTvSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesRecommendationBloc(
      getTvSeriesRecommendations: locator(),
    ),
  );
  locator.registerFactory(
        () => TvSeriesDetailSeasonBloc(
      getTvSeriesSeasonDetail: locator(),
    ),
  );
  //#endregion BLOC

  //#region USE CASES
  locator.registerLazySingleton(() => GetNowPlayingTvSeries(locator()));
  locator.registerLazySingleton(() => GetPopularTvSeries(locator()));
  locator.registerLazySingleton(() => GetTopRatedTvSeries(locator()));
  locator.registerLazySingleton(() => GetTvSeriesDetail(locator()));
  locator.registerLazySingleton(() => GetTvSeriesRecommendations(locator()));
  locator.registerLazySingleton(() => SearchTvSeries(locator()));
  locator.registerLazySingleton(() => GetWatchListStatusTvSeries(locator()));
  locator.registerLazySingleton(() => SaveWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => GetWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => GetTvSeriesSeasonDetail(locator()));
  //#endregion USE CASES

  //#region REPOSITORIES
  locator.registerLazySingleton<TvSeriesRepository>(
    () => TvSeriesRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  //#endregion REPOSITORIES

  //#region DATA SOURCES
  locator.registerLazySingleton<TvSeriesRemoteDataSource>(
    () => TvSeriesRemoteDataSourceImpl(
      client: locator(),
    ),
  );
  locator.registerLazySingleton<TvSeriesLocalDataSource>(
    () => TvSeriesLocalDataSourceImpl(
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
  // locator.registerLazySingleton(
  //   () => HttpSSLPinning.client,
  // );
  //#endregion EXTERNAL
}
