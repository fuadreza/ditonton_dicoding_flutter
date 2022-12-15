
import 'package:ditonton_dicoding_flutter/domain/usecases/get_now_playing_tvseries.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_popular_tvseries.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_top_rated_tvseries.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_tvseries_detail.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_tvseries_recommendations.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_watchlist_status_tvseries.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_watchlist_tvseries.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/remove_watchlist_tvseries.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/save_watchlist_tvseries.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/search_tvseries.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
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