import 'package:dartz/dartz.dart';
import 'package:movie_app/data/models/movies_model.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/movie_search_param.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

import '../entities/app_error.dart';
import 'no_params.dart';

class GetSearchMovies extends UseCase<List<MovieEntity>,MovieSearchParam>{
  final MovieRepository repository;
  GetSearchMovies(this.repository);

  @override
  Future<Either<AppError,List<MovieEntity>>> call(MovieSearchParam searchParam) async{
    return await repository.getSearchedMovie(searchParam.searchTerm);
  }
}