part of 'cast_bloc.dart';

abstract class CastEvent extends Equatable {
  const CastEvent();
}


class LoadCastEvent extends CastEvent{
  final int movieId;
  const LoadCastEvent(this.movieId);
  @override
  List<Object?> get props => [movieId];

}