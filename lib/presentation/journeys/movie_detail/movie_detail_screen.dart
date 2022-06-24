import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/constants/translation_constants.dart';
import 'package:movie_app/common/extensions/size_extension.dart';
import 'package:movie_app/common/extensions/string_extension.dart';
import 'package:movie_app/di/get_it.dart';
import 'package:movie_app/presentation/blocs/cast/cast_bloc.dart';
import 'package:movie_app/presentation/blocs/favourite/favourite_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_app/presentation/blocs/videos/video_bloc.dart';
import 'package:movie_app/presentation/journeys/movie_detail/cast_widget.dart';
import 'package:movie_app/presentation/journeys/movie_detail/video_widget.dart';

import 'big_poster.dart';
import 'movie_detail_arguments.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailarguments movieDetailarguments;

  const MovieDetailScreen({Key? key, required this.movieDetailarguments})
      : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late final MovieDetailBloc _movieDetailBloc;
  late final CastBloc _castBloc;
  late final VideoBloc _videoBloc;
  late final FavouriteBloc _favouriteBloc;
  @override
  void initState() {
    super.initState();
    _movieDetailBloc = getItInstance<MovieDetailBloc>();
    _castBloc = _movieDetailBloc.castBloc;
    _videoBloc = _movieDetailBloc.videoBloc;
    _favouriteBloc = _movieDetailBloc.favouriteBloc;

    // print(widget.movieDetailarguments.movieId);
    _movieDetailBloc.add(
      MovieDetailLoadEvent(widget.movieDetailarguments.movieId),
    );
  }

  @override
  void dispose() {
    _movieDetailBloc.close();
    _castBloc.close();
    _videoBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _movieDetailBloc),
          BlocProvider.value(value: _castBloc),
          BlocProvider.value(value: _videoBloc),
          BlocProvider.value(value: _favouriteBloc),
        ],
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              final movieDetail = state.movieDetailEntity;
              // print("movieDetailData");

              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BigPoster(
                      movie: movieDetail,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_16.w.toDouble(),
                        vertical: Sizes.dimen_8.h.toDouble(),
                      ),
                      child: Text(movieDetail.overview),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_16.w.toDouble(),
                      ),
                      child: Text(
                        TranslationConstant.cast.trans(context),
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    const CastWidget(),
                    VideosWidget(videosBloc: _videoBloc,),
                  ],
                ),
              );
            }
            if (state is MovieDetailError) {
              return const Center(child: Text("error"));
            }
            return const Center(child: Text('SomeThing Else'));
          },
        ),
      ),
    );
  }
}
