import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/route_constant.dart';
import 'package:movie_app/common/constants/translation_constants.dart';
import 'package:movie_app/common/extensions/string_extension.dart';
import 'package:movie_app/presentation/blocs/videos/video_bloc.dart';
import 'package:movie_app/presentation/journeys/watch_video/watch_video_arguments.dart';
import 'package:movie_app/presentation/routes.dart';
import 'package:movie_app/presentation/widget/button.dart';

import '../watch_video/watch_video_screen.dart';

class VideosWidget extends StatelessWidget {
  final VideoBloc videosBloc;

  const VideosWidget({
    Key? key,
    required this.videosBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: videosBloc,
      builder: (context, state) {
        if (state is VideoLoaded && state.videos.isNotEmpty) {
          final videos = state.videos;
          // print(state.videos.length);
          return Button(
            title: TranslationConstant.watchTrailers.trans(context),
            onPressed: () {
              Navigator.of(context).pushNamed(
                RouteList.watch_trailer_screen,
                arguments: WatchVideoArguments(videos),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
