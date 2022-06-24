import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/repositories/app_repository.dart';
import 'package:movie_app/domain/usecases/no_params.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

class GetPrefferdLanguage extends UseCase<String,NoParams>{
  final AppRepository appRepository;
  GetPrefferdLanguage(this.appRepository);
  @override
  Future<Either<AppError, String>> call(NoParams noParams) async{
    return await appRepository.getPrefferedLanguage();
  }

}