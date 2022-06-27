
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/movie_search_param.dart';
import 'package:movie_app/domain/usecases/get_searched_movie.dart';
import 'package:movie_app/presentation/blocs/loading/loading_bloc.dart';

part 'search_movie_event.dart';

part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final GetSearchMovies getSearchMovie;
  final LoadingBloc loadingBloc;
  SearchMovieBloc({required this.getSearchMovie,required this.loadingBloc})
      : super(SearchMovieInitial()) {
    on<SearchTermChangedEvent>((event, emit) async {
      loadingBloc.add(StartLoading());
      final res = await getSearchMovie(MovieSearchParam(event.searchTerm));
      final data = res.fold(
        (l) => SearchMovieError(appErrorType: l.appErrorType),
        (r) => SearchMovieLoaded(movieList: r),
      );
      emit(data);
      loadingBloc.add(FinishLoading());
    });
  }
}
