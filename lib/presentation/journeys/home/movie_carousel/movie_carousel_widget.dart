import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/journeys/home/movie_carousel/movie_backdrop_widget.dart';
import 'package:movie_app/presentation/journeys/home/movie_carousel/movie_data_widget.dart';
import 'package:movie_app/presentation/widget/seperator.dart';

import '../../../widget/movie_app_bar.dart';
import 'movie_page_view.dart';

class MovieCarouselWidget extends StatelessWidget {
  const MovieCarouselWidget({Key? key, required this.movies, required this.defaultIndex})
      : super(key: key);
  final List<MovieEntity> movies;
  final int defaultIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const MovieBackdropWidget(),
        Column(
          children: [
            const MovieAppBar(),
            MoviePageView(
              movies: movies,
              initialPage: defaultIndex,
            ),
            const MovieDataWidget(),
            const Separator(),
          ],
        ),
      ],
    );
  }
}
