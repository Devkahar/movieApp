


import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/no_params.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

class GetFavouriteMovies extends UseCase<List<MovieEntity>,NoParams>{
  MovieRepository movieRepository;
  GetFavouriteMovies(this.movieRepository);
  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams params) async{
    return await movieRepository.getFavouriteMovies();
  }
}