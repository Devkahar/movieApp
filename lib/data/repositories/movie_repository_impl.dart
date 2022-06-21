

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:movie_app/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

import '../../domain/entities/app_error.dart';
import '../models/movies_model.dart';

class MovieRepositoryImpl extends MovieRepository{
  final MovieRemoteDataSource remoteDataSource;
  MovieRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<AppError,List<MovieEntity>>> getTrending() async{
    try{
      final movies = await remoteDataSource.getTrending();
      if(movies.isEmpty)  return const Left(AppError(AppErrorType.network));
      return Right(movies);
    }
    on SocketException{
      return const Left(AppError(AppErrorType.network));
    }
    on Exception{
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async{
    try{
      final movies = await remoteDataSource.getPlayingNow();
      if(movies.isEmpty)  return const Left(AppError(AppErrorType.network));
      return Right(movies);
    }on SocketException{
      return const Left(AppError(AppErrorType.network));
    }
    on Exception{
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async{
    try{
      final movies = await remoteDataSource.getPopular();
      if(movies.isEmpty)  return const Left(AppError(AppErrorType.network));
      return Right(movies);
    }on SocketException{
      return const Left(AppError(AppErrorType.network));
    }
    on Exception{
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getUpcoming()async {
    try{
      final movies = await remoteDataSource.getUpcoming();
      if(movies.isEmpty)  return const Left(AppError(AppErrorType.network));
      return Right(movies);
    }on SocketException{
      return const Left(AppError(AppErrorType.network));
    }
    on Exception{
      return const Left(AppError(AppErrorType.api));
    }
  }

}