

import 'package:dartz/dartz.dart';
import 'package:movie_app/data/models/movies_model.dart';
import 'package:movie_app/domain/entities/app_error.dart';
abstract class MovieRepository{
  Future<Either<AppError,List<MovieModel>>> getTrending();
  Future<Either<AppError,List<MovieModel>>> getPopular();
  Future<Either<AppError,List<MovieModel>>> getPlayingNow();
  Future<Either<AppError,List<MovieModel>>> getUpcoming();
}