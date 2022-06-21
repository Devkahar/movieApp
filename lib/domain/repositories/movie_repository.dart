

import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/MovieDetailEntity.dart';
import 'package:movie_app/domain/entities/app_error.dart';

import '../entities/movie_entity.dart';
abstract class MovieRepository{
  Future<Either<AppError,List<MovieEntity>>> getTrending();
  Future<Either<AppError,List<MovieEntity>>> getPopular();
  Future<Either<AppError,List<MovieEntity>>> getPlayingNow();
  Future<Either<AppError,List<MovieEntity>>> getUpcoming();
  Future<Either<AppError,MovieDetailEntity>> getMovieDetail(int id);
}