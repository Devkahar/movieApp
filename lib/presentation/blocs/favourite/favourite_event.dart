part of 'favourite_bloc.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

}

class DeleteFavouriteMovieEvent extends FavouriteEvent{

  final int movieId;
  const DeleteFavouriteMovieEvent(this.movieId);
  @override
  List<Object?> get props => [movieId];
}

class ToggleFavouriteMovieEvent extends FavouriteEvent{

  final MovieEntity movie;
  final bool isFavourite;
  const ToggleFavouriteMovieEvent(this.movie,this.isFavourite);
  @override
  List<Object?> get props => [movie,isFavourite];
}
class CheckIfFavouriteMovieEvent extends FavouriteEvent{

  final String movieId;
  const CheckIfFavouriteMovieEvent(this.movieId);
  @override
  List<Object?> get props => [movieId];
}

class FavouriteMovieLoadEvent extends FavouriteEvent{
  const FavouriteMovieLoadEvent();
  @override
  List<Object?> get props => [];
}