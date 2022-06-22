import 'dart:convert';

import 'package:movie_app/core/api_constants.dart';
import 'package:movie_app/data/data_source/api_client.dart';
import 'package:movie_app/data/models/cast_crew_data_model.dart';
import 'package:movie_app/data/models/movie_detail_model.dart';
import 'package:movie_app/data/models/movies_model.dart';
import 'package:movie_app/data/models/movies_result_model.dart';
import 'package:http/http.dart';
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

}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;
  MovieRemoteDataSourceImpl(this._client);
  @override
  Future<List<MovieModel>> getTrending() async {
    try{
      final res = await _client.get('trending/movie/day');
      if(res!=null){
        final movies = MoviesResultModel.fromJson(res).movies;
        print(movies);
        return movies??[];
      }else{
        throw 'Unable to fetch data';
      }
    }catch(error){
      print(error);
      return [];
    }
  }

  @override
  Future<List<MovieModel>> getPopular()async {
    try{
      final res = await _client.get('movie/popular');
      if(res!=null){
        final movies = MoviesResultModel.fromJson(res).movies;
        print(movies);
        return movies??[];
      }else{
        throw 'Unable to fetch data';
      }
    }catch(error){
      print(error);
      return [];
    }
  }

  @override
  Future<List<MovieModel>> getPlayingNow()async{
    try{
      final res = await _client.get('movie/top_rated');
      if(res!=null){
        final movies = MoviesResultModel.fromJson(res).movies;
        print(movies);
        return movies??[];
      }else{
        throw 'Unable to fetch data';
      }
    }catch(error){
      print(error);
      return [];
    }
  }

  @override
  Future<List<MovieModel>> getUpcoming() async{
      final res = await _client.get('movie/upcoming');
      final movies = MoviesResultModel.fromJson(res).movies;
      return movies??[];
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async{
    final res = await _client.get('movie/$id');
    final movieDetail = MovieDetailModel.fromJson(res);
    return movieDetail;
  }

  @override
  Future<List<CastModel>> getCrewCast(int id) async{
    final res = await _client.get('movie/$id/credits');
    final cast = CastCrewResultModel.fromJson(res).cast;
    return cast??[];
  }

  @override
  Future<List<VideoModel>> getVideos(int id) async{
    final res = await _client.get('movie/$id/videos');
    final video = VideoResultModel.fromJson(res);
    return video.videos;
  }
}
