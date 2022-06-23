

import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_param.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

class CheckIsFavouriteMovie extends UseCase<bool,MovieParam>{
  MovieRepository movieRepository;
  CheckIsFavouriteMovie(this.movieRepository);
  @override
  Future<Either<AppError, bool>> call(MovieParam params) {
    return movieRepository.checkIfMovieFavourite(params.id);
  }
}