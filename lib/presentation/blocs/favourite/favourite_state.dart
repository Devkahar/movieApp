part of 'favourite_bloc.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState();
  @override
  List<Object> get props => [];
}

class FavouriteInitial extends FavouriteState {}
class FavouriteMovieLoaded extends FavouriteState {
  final List<MovieEntity> movie;
  const FavouriteMovieLoaded(this.movie);

  @override
  List<Object> get props => [movie];
}

class FavouriteMovieError extends FavouriteState {}

class IsFavourite extends FavouriteState {
  final bool isFavourite;
  const IsFavourite(this.isFavourite);

  @override
  List<Object> get props => [isFavourite];
}
