

import 'package:dartz/dartz.dart';
import 'package:movie_app/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

import '../../domain/entities/app_error.dart';
import '../models/movies_model.dart';

class MovieRepositoryImpl extends MovieRepository{
  final MovieRemoteDataSource remoteDataSource;
  MovieRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<AppError,List<MovieModel>>> getTrending() async{
    try{
      final movies = await remoteDataSource.getTrending();
      return Right(movies);
    }on Exception{
        return const Left(AppError('Something Went Wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getPlayingNow() async{
    try{
      final movies = await remoteDataSource.getPlayingNow();
      return Right(movies);
    }on Exception{
      return const Left(AppError('Something Went Wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getPopular() async{
    try{
      final movies = await remoteDataSource.getPopular();
      return Right(movies);
    }on Exception{
      return const Left(AppError('Something Went Wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getUpcoming()async {
    try{
      final movies = await remoteDataSource.getUpcoming();
      return Right(movies);
    }on Exception{
      return const Left(AppError('Something Went Wrong'));
    }
  }

}