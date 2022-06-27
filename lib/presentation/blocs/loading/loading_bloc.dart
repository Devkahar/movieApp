import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc() : super(LoadingInitial()) {
    on<StartLoading>((event, emit) {
      emit(StartLoadingStart());
    });

    on<FinishLoading>((event, emit) {
      emit(EndLoadingStart());
    });
  }
}
