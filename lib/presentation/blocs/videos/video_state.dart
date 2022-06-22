part of 'video_bloc.dart';

abstract class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object> get props => [];
}

class VideoInitial extends VideoState {}

class NoVideos extends VideoState {}
class VideosError extends VideoState {}

class VideoLoaded extends VideoState {
  final List<VideoEntity> videos;

  VideoLoaded(this.videos);

  @override
  List<Object> get props => [videos];
}