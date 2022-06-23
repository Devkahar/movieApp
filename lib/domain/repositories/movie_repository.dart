

import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';
import 'package:movie_app/domain/entities/video_entity.dart';

import '../entities/movie_entity.dart';
abstract class MovieRepository{
  Future<Either<AppError,List<MovieEntity>>> getTrending();
  Future<Either<AppError,List<MovieEntity>>> getPopular();
  Future<Either<AppError,List<MovieEntity>>> getPlayingNow();
  Future<Either<AppError,List<MovieEntity>>> getUpcoming();
  Future<Either<AppError,MovieDetailEntity>> getMovieDetail(int id);
  Future<Either<AppError,List<CastEntity>>> getCastCrew(int id);
  Future<Either<AppError, List<VideoEntity>>> getVideos(int id);
  Future<Either<AppError, List<MovieEntity>>> getSearchedMovie(String searchTerm);
  Future<Either<AppError,void>> saveMovie(MovieEntity movieEntity);
  Future<Either<AppError,void>> deleteFavouriteMovies(int movieId);
  Future<Either<AppError,List<MovieEntity>>> getFavouriteMovies();
  Future<Either<AppError,bool>> checkIfMovieFavourite(int movieId);
}