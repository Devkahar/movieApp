import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:movie_app/data/data_source/authentication_local_data_source.dart';
import 'package:movie_app/data/data_source/authentication_remote_data_source.dart';
import 'package:movie_app/data/data_source/unauthorized_exception.dart';
import 'package:movie_app/data/models/request_token_model.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationRemoteDataSource _authenticationRemoteDataSource;
  final AuthenticationLocalDataSource _authenticationLocalDataSource;

  AuthenticationRepositoryImpl(
      this._authenticationRemoteDataSource,
      this._authenticationLocalDataSource,
      );

  Future<Either<AppError, RequestTokenModel>> _getRequestToken() async {
    try {
      final response = await _authenticationRemoteDataSource.getRequestToken();
      return Right(response);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, bool>> loginUser(Map<String, dynamic> body) async {
    final requestTokenEitherResponse = await _getRequestToken();
    final token1 = requestTokenEitherResponse.fold((l) => '', (r) => r.requestToken);

    try {
      body.putIfAbsent('request_token', () => token1);
      final validateWithLoginToken =
      await _authenticationRemoteDataSource.validateWithLogin(body);
      final sessionId = await _authenticationRemoteDataSource
          .createSession(validateWithLoginToken.toJson());
      await _authenticationLocalDataSource.saveSessionId(sessionId);
      return const Right(true);
      return const Left(AppError(AppErrorType.sessionDenied));
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on UnauthorisedException {
      return const Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, void>> logoutUser() async {
    final sessionId = await _authenticationLocalDataSource.getSessionId();
    await Future.wait([
      _authenticationRemoteDataSource.deleteSession(sessionId),
      _authenticationLocalDataSource.deleteSessionId(),
    ]);
    print(await _authenticationLocalDataSource.getSessionId());
    return const Right(Unit);
  }
}