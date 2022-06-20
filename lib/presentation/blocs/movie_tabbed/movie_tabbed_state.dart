part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedState extends Equatable {
  const MovieTabbedState({required this.currentTabIndex});
  final int currentTabIndex;
  @override
  List<Object> get props => [currentTabIndex];
}

class MovieTabbedInitial extends MovieTabbedState {
  const MovieTabbedInitial({required super.currentTabIndex});

  @override
  List<Object> get props => [];
}
class MovieTabChange extends MovieTabbedState{
  final List<MovieEntity> movies;
  const MovieTabChange({required this.movies,required super.currentTabIndex});
}

class MovieTabLoadError extends MovieTabbedState{
  const MovieTabLoadError({required super.currentTabIndex});

}
