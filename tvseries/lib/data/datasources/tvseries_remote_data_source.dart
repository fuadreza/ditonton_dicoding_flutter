import 'dart:convert';

import 'package:core/services/base_api_client.dart';
import 'package:tvseries/data/models/season_detail_model.dart';
import 'package:tvseries/data/models/tvseries_detail_model.dart';
import 'package:tvseries/data/models/tvseries_model.dart';
import 'package:tvseries/data/models/tvseries_response.dart';

abstract class TvSeriesRemoteDataSource {
  Future<List<TvSeriesModel>> getNowPlayingTvSeries();

  Future<List<TvSeriesModel>> getPopularTvSeries();

  Future<List<TvSeriesModel>> getTopRatedTvSeries();

  Future<TvSeriesDetailModel> getTvSeriesDetail(int id);

  Future<List<TvSeriesModel>> getTvSeriesRecommendations(int id);

  Future<List<TvSeriesModel>> searchTvSeries(String query);

  Future<SeasonDetailModel> getSeasons(int tvId, int seasonNumber);
}

class TvSeriesRemoteDataSourceImpl implements TvSeriesRemoteDataSource {
  TvSeriesRemoteDataSourceImpl({required this.client});

  final BaseApiClient client;

  @override
  Future<List<TvSeriesModel>> getNowPlayingTvSeries() async {
    final response = await client.get(url: '/3/tv/on_the_air');

    return TvSeriesResponse.fromJson(json.decode(response)).tvSeriesList;
  }

  @override
  Future<TvSeriesDetailModel> getTvSeriesDetail(int id) async {
    final response = await client.get(url: '/3/tv/$id');

    return TvSeriesDetailModel.fromJson(json.decode(response));
  }

  @override
  Future<List<TvSeriesModel>> getTvSeriesRecommendations(int id) async {
    final response = await client.get(url: '/3/tv/$id/recommendations');

    return TvSeriesResponse.fromJson(json.decode(response)).tvSeriesList;
  }

  @override
  Future<List<TvSeriesModel>> getPopularTvSeries() async {
    final response = await client.get(url: '/3/tv/popular');

    return TvSeriesResponse.fromJson(json.decode(response)).tvSeriesList;
  }

  @override
  Future<List<TvSeriesModel>> getTopRatedTvSeries() async {
    final response = await client.get(url: '/3/tv/top_rated');

    return TvSeriesResponse.fromJson(json.decode(response)).tvSeriesList;
  }

  @override
  Future<List<TvSeriesModel>> searchTvSeries(String query) async {
    final params = {'query': query};
    final response = await client.get(url: '/3/search/tv', params: params);

    return TvSeriesResponse.fromJson(json.decode(response)).tvSeriesList;
  }

  @override
  Future<SeasonDetailModel> getSeasons(int tvId, int seasonNumber) async {
    final response = await client.get(url: '/3/tv/$tvId/season/$seasonNumber');
    return SeasonDetailModel.fromJson(json.decode(response));
  }
}
