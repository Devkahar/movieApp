

import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/MovieDetailEntity.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

import '../entities/MovieParam.dart';
import '../entities/app_error.dart';
import '../entities/movie_entity.dart';
import 'no_params.dart';

class GetMovieDetail extends UseCase<MovieDetailEntity,MovieParam>{
  final MovieRepository repository;
  GetMovieDetail(this.repository);

  @override
  Future<Either<AppError,MovieDetailEntity>> call(MovieParam movieParam) async{
    return await repository.getMovieDetail(movieParam.id);
  }
}