

import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

class SaveMovie extends UseCase<void,MovieEntity>{
  MovieRepository movieRepository;
  SaveMovie(this.movieRepository);
  @override
  Future<Either<AppError, void>> call(MovieEntity params) {
    return movieRepository.saveMovie(params);
  }

}