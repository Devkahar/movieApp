import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/MovieParam.dart';
import 'package:movie_app/domain/entities/video_entity.dart';
import 'package:movie_app/domain/usecases/get_video.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final GetVideos getVideos;

  VideoBloc({required this.getVideos}) : super(VideoInitial()) {
    on<VideoLoadEvent>((event, emit) async{
      final res = await getVideos(MovieParam(event.movieId));
      final data = res.fold((l) => NoVideos(), (r) => VideoLoaded(r));
      emit(data);
    });
  }
}
