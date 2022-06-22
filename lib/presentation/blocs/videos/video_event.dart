part of 'video_bloc.dart';

abstract class VideoEvent extends Equatable {
  const VideoEvent();
}
class VideoLoadEvent extends VideoEvent{

  final int movieId;

  const VideoLoadEvent({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
