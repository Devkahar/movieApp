

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:movie_app/data/data_source/movie_local_data_source.dart';
import 'package:movie_app/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/data/tabels/movie_table.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/video_entity.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

import '../../domain/entities/app_error.dart';

class MovieRepositoryImpl extends MovieRepository{
  final MovieRemoteDataSource remoteDataSource;
  final MovieLocalDataSource movieLocalDataSource;
  MovieRepositoryImpl(this.remoteDataSource, this.movieLocalDataSource);
  @override
  Future<Either<AppError,List<MovieEntity>>> getTrending() async{
    try{
      final movies = await remoteDataSource.getTrending();

      return Right(movies);
    }
    on SocketException{
      return const Left(AppError(AppErrorType.network));
    }
    on Exception{
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async{
    try{
      final movies = await remoteDataSource.getPlayingNow();

      return Right(movies);
    }on SocketException{
      return const Left(AppError(AppErrorType.network));
    }
    on Exception{
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async{
    try{
      final movies = await remoteDataSource.getPopular();

      return Right(movies);
    }on SocketException{
      return const Left(AppError(AppErrorType.network));
    }
    on Exception{
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getUpcoming()async {
    try{
      final movies = await remoteDataSource.getUpcoming();
      return Right(movies);
    }on SocketException{
      return const Left(AppError(AppErrorType.network));
    }
    on Exception{
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, MovieDetailEntity>> getMovieDetail(int id) async{
    try{
      final movies = await remoteDataSource.getMovieDetail(id);
      return Right(movies);
    }on SocketException{
      return const Left(AppError(AppErrorType.network));
    }
    on Exception{
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<CastEntity>>> getCastCrew(int id) async{
    try{
      final cast = await remoteDataSource.getCrewCast(id);
      return Right(cast);
    }on SocketException{
      return const Left(AppError(AppErrorType.network));
    }
    on Exception{
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<VideoEntity>>> getVideos(int id) async{
    try {
      final videos = await remoteDataSource.getVideos(id);
      return Right(videos);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getSearchedMovie(String searchTerm) async{
    try{
      final movies = await remoteDataSource.getSearchMovies(searchTerm);
      return Right(movies);
    }on SocketException{
      return const Left(AppError(AppErrorType.network));
    }
    on Exception{
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, bool>> checkIfMovieFavourite(int movieId)async {
    try{
      final res = await movieLocalDataSource.checkIfMovieFavourite(movieId);
      return Right(res);
    }catch(error){
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> deleteFavouriteMovies(int movieId) async{
    try{
      final res =await movieLocalDataSource.deleteMovie(movieId);
      return Right(res);
    }catch(error){
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getFavouriteMovies() async{
    try{
      final res = await movieLocalDataSource.getMovies();
      return Right(res);
    }catch(error){
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> saveMovie(MovieEntity movieEntity) async{
    try{
      final res = await movieLocalDataSource.saveMovie(MovieTable.fromMovieEntity(movieEntity));
      return Right(res);
    }catch(error){
      return const Left(AppError(AppErrorType.database));
    }
  }
}