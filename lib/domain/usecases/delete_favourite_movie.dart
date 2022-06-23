

import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_param.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

class DeleteFavouriteMovie extends UseCase<void,MovieParam>{
  MovieRepository movieRepository;
  DeleteFavouriteMovie(this.movieRepository);
  @override
  Future<Either<AppError, void>> call(MovieParam params) {
    return movieRepository.deleteFavouriteMovies(params.id);
  }
}