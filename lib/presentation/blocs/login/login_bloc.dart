import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/common/constants/translation_constants.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/login_request_param.dart';
import 'package:movie_app/domain/usecases/login_user.dart';
import 'package:movie_app/domain/usecases/logout_user.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser loginUser;
  final LogoutUser logoutUser;

  LoginBloc({
    required this.loginUser,
    required this.logoutUser,
  }) : super(LoginInitial()) {
    on<LoginInitiateEvent>(
      (event, emit) async {
        final Either<AppError, bool> eitherResponse = await loginUser(
          LoginRequestParams(
            userName: event.username,
            password: event.password,
          ),
        );
        final data = eitherResponse.fold(
          (l) {
            var message = getErrorMessage(l.appErrorType);
            print(message);
            return LoginError(message);
          },
          (r) => LoginSuccess(),
        );
        emit(data);
      },
    );
    on<LogoutEvent>(
      (event, emit)async{
        emit(LogoutSuccess());
      }
    );
  }

  String getErrorMessage(AppErrorType appErrorType) {
    switch (appErrorType) {
      case AppErrorType.network:
        return TranslationConstant.noNetwork;
      case AppErrorType.api:
      case AppErrorType.database:
        return TranslationConstant.somethingWentWrong;
      case AppErrorType.sessionDenied:
        return TranslationConstant.sessionDenied;
      default:
        return TranslationConstant.wrongUsernamePassword;
    }
  }
}
