import 'package:movie_app/data/data_source/api_client.dart';
import 'package:movie_app/data/models/cast_crew_data_model.dart';
import 'package:movie_app/data/models/movie_detail_model.dart';
import 'package:movie_app/data/models/movies_model.dart';
import 'package:movie_app/data/models/movies_result_model.dart';
import 'package:movie_app/data/models/video_model.dart';
import 'package:movie_app/data/models/video_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();

  Future<List<MovieModel>> getPopular();

  Future<List<MovieModel>> getPlayingNow();

  Future<List<MovieModel>> getUpcoming();

  Future<MovieDetailModel> getMovieDetail(int id);

  Future<List<CastModel>> getCrewCast(int id);

  Future<List<VideoModel>> getVideos(int id);

  Future<List<MovieModel>> getSearchMovies(String searchTerm);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final res = await _client.get('trending/movie/day');

    final movies = MoviesResultModel.fromJson(res).movies;
    return movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final res = await _client.get('movie/popular');
    final movies = MoviesResultModel.fromJson(res).movies;
    return movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final res = await _client.get('movie/top_rated');
    final movies = MoviesResultModel.fromJson(res).movies;
    return movies;
  }

  @override
  Future<List<MovieModel>> getUpcoming() async {
    final res = await _client.get('movie/upcoming');
    final movies = MoviesResultModel.fromJson(res).movies;
    return movies;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final res = await _client.get('movie/$id');
    final movieDetail = MovieDetailModel.fromJson(res);
    return movieDetail;
  }

  @override
  Future<List<CastModel>> getCrewCast(int id) async {
    final res = await _client.get('movie/$id/credits');
    final cast = CastCrewResultModel.fromJson(res).cast;
    return cast ?? [];
  }

  @override
  Future<List<VideoModel>> getVideos(int id) async {
    final res = await _client.get('movie/$id/videos');
    final video = VideoResultModel.fromJson(res);
    return video.videos;
  }

  @override
  Future<List<MovieModel>> getSearchMovies(String searchTerm) async {
    final res = await _client.get('search/movie', params: {
      'query': searchTerm,
    });
    final movies = MoviesResultModel.fromJson(res).movies;
    return movies;
  }
}
