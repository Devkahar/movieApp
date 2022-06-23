import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/movie_search_param.dart';
import 'package:movie_app/domain/usecases/get_searched_movie.dart';

part 'search_movie_event.dart';

part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final GetSearchMovies getSearchMovie;

  SearchMovieBloc({required this.getSearchMovie})
      : super(SearchMovieInitial()) {
    on<SearchTermChangedEvent>((event, emit) async {
      final res = await getSearchMovie(MovieSearchParam(event.searchTerm));
      final data = res.fold(
        (l) => SearchMovieError(),
        (r) => SearchMovieLoaded(movieList: r),
      );
      emit(data);
    });
  }
}
