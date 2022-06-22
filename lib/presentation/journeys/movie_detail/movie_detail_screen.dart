import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/size_extension.dart';
import 'package:movie_app/di/get_it.dart';
import 'package:movie_app/presentation/blocs/movie_detail/movie_detail_bloc.dart';

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

  @override
  void initState() {
    super.initState();
    _movieDetailBloc = getItInstance<MovieDetailBloc>();
    print(widget.movieDetailarguments.movieId);
    _movieDetailBloc
        .add(MovieDetailLoadEvent(widget.movieDetailarguments.movieId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MovieDetailBloc>(
        create: (context) => _movieDetailBloc,
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              final movieDetail = state.movieDetailEntity;
              print("movieDetailData");

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BigPoster(
                    movie: movieDetail,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Sizes.dimen_4.h.toDouble(),
                    ),
                    child: Text(movieDetail.overview),
                  ),
                ],
              );
            }
            if (state is MovieDetailError) {
              return Container(
                child: const Text("error"),
              );
            }

            return const Text('SomeThing Else');
          },
        ),
      ),
    );
  }
}
