import 'dart:convert';

import 'package:movie_app/core/api_constants.dart';
import 'package:movie_app/data/data_source/api_client.dart';
import 'package:movie_app/data/models/movies_model.dart';
import 'package:movie_app/data/models/movies_result_model.dart';
import 'package:http/http.dart';
abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getUpcoming();
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
    try{
      final res = await _client.get('movie/upcoming');
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
}
