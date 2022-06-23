part of 'search_movie_bloc.dart';

abstract class SearchMovieState extends Equatable {
  const SearchMovieState();
  @override
  List<Object> get props => [];
}

class SearchMovieInitial extends SearchMovieState {
}

class SearchMovieLoaded extends SearchMovieState {
  final List<MovieEntity> movieList;
  const SearchMovieLoaded({required this.movieList});
  @override
  List<Object> get props => [movieList];
}
class SearchMovieLoading extends SearchMovieState {
}
class SearchMovieError extends SearchMovieState {
  final AppErrorType appErrorType;

  const SearchMovieError({required this.appErrorType});

}