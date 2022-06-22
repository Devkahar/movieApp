part of 'cast_bloc.dart';

abstract class CastState extends Equatable {
  const CastState();
  @override
  List<Object> get props => [];
}

class CastInitial extends CastState {}
class CastError extends CastState {}

class CastLoaded extends CastState {
  List<CastEntity> cast;
  CastLoaded({required this.cast});
}


