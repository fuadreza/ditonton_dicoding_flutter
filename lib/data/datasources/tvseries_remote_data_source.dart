import 'dart:convert';

import 'package:ditonton_dicoding_flutter/common/services/base_api_client.dart';
import 'package:ditonton_dicoding_flutter/data/models/tvseries_model.dart';
import 'package:ditonton_dicoding_flutter/data/models/tvseries_response.dart';

abstract class TvSeriesRemoteDataSource {
  Future<List<TvSeriesModel>> getNowPlayingTvSeries();

  Future<List<TvSeriesModel>> getPopularTvSeries();

  Future<List<TvSeriesModel>> getTopRatedTvSeries();

  Future<String> getTvSeriesDetail(int id);

  Future<String> getMovieRecommendations(int id);

  Future<String> searchTvSeries(String query);
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
  Future<String> getTvSeriesDetail(int id) async {
    final response = await client.get(url: '/3/movie/$id');

    return response;
    // return MovieDetailResponse.fromJson(json.decode(response));
  }

  @override
  Future<String> getMovieRecommendations(int id) async {
    final response = await client.get(url: '/3/movie/$id/recommendations');

    return response;
    // return MovieResponse.fromJson(json.decode(response)).movieList;
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
  Future<String> searchTvSeries(String query) async {
    final params = {'query': query};
    final response = await client.get(url: '/3/search_movie/movie', params: params);

    return response;
    // return MovieResponse.fromJson(json.decode(response)).movieList;
  }
}
