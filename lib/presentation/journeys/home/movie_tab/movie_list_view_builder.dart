import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/size_extension.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/journeys/home/movie_tab/movie_tab_card_widget.dart';

class MovieListViewBuilder extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieListViewBuilder({Key? key, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h.toDouble()),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (ctx, idx) => MovieTabCardWidget(
          title: movies[idx].title,
          posterPath: movies[idx].posterPath,
          id: movies[idx].id,
        ),
        itemCount: movies.length,
        separatorBuilder: (ctx, idx) {
          return SizedBox(
            width: Sizes.dimen_4.w.toDouble(),
          );
        },
      ),
    );
  }
}
