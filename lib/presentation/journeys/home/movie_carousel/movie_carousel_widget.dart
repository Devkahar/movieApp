import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

import '../../../widget/movie_app_bar.dart';
import 'movie_page_view.dart';

class MovieCarouselWidget extends StatelessWidget {
  const MovieCarouselWidget({Key? key, required this.movies, required this.defaultIndex})
      : super(key: key);
  final List<MovieEntity> movies;
  final int defaultIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MovieAppBar(),
        MoviePageView(
          movies: movies,
          initialPage: defaultIndex,
        ),
      ],
    );
  }
}
