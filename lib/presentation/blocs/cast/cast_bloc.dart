import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_param.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';
import 'package:movie_app/domain/usecases/get_crewcast.dart';

part 'cast_event.dart';
part 'cast_state.dart';


class CastBloc extends Bloc<CastEvent, CastState> {

  final GetCast getCast;
  CastBloc({required this.getCast}) : super(CastInitial()) {
    on<LoadCastEvent>((event, emit) async{
      Either<AppError,List<CastEntity>> res = await getCast(MovieParam(event.movieId));
      // print("Exec");
      final data = res.fold((l) => CastError(), (cast) => CastLoaded(cast: cast));
      emit(data);
    });
  }
}
