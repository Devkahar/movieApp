

import 'package:dartz/dartz.dart';
import 'package:movie_app/data/data_source/language_local_data_source.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/repositories/app_repository.dart';

class AppRepositoryImpl extends AppRepository{
  LanguageLocalDataSource languageLocalDataSource;
  AppRepositoryImpl(this.languageLocalDataSource);
  @override
  Future<Either<AppError, String>> getPrefferedLanguage()async {
    try{
      final res = await languageLocalDataSource.getPrefferdLanguage();
      return Right(res);
    }on Exception{
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> updateLanguage(String language) async{
    try{
      final res = languageLocalDataSource.updateLanguage(language);
      return Right(res);
    }on Exception{
      return const Left(AppError(AppErrorType.database));
    }
  }

}