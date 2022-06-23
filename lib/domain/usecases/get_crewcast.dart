

import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

import '../entities/movie_param.dart';
import '../entities/app_error.dart';

class GetCast extends UseCase<List<CastEntity>,MovieParam>{
  final MovieRepository repository;
  GetCast(this.repository);

  @override
  Future<Either<AppError,List<CastEntity>>> call(MovieParam movieParam) async{
    return await repository.getCastCrew(movieParam.id);
  }
}