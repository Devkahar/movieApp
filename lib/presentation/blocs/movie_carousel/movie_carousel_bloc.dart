import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/usecases/no_params.dart';
import 'package:movie_app/domain/usecases/get_trending.dart';

part 'movie_carousel_event.dart';

part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;

  MovieCarouselBloc({
    required this.getTrending,
  }) : super(MovieCarouselInitial()) {
    on<CarouselLoadEvent>((event, emit) async {
      print("Event was laoded");
      final movieEighter = await getTrending(NoParams());
      final data = movieEighter.fold(
        (l) => MovieCarouselError(),
        (movies) => MovieCarouselLoaded(
          movies: movies,
          defaultIndex: event.defaultIndex,
        ),
      );
      emit(data);
    });
  }

// @override
// Stream<MovieCarouselState> mapEventToState(
//   MovieCarouselEvent event,
// )
}
