import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/double_extension.dart';
import 'package:movie_app/common/extensions/size_extension.dart';
import 'package:movie_app/common/screenutil/screenutil.dart';
import 'package:movie_app/core/api_constants.dart';
import 'package:movie_app/domain/entities/MovieDetailEntity.dart';
import 'package:movie_app/presentation/journeys/movie_detail/movie_detail_app_bar.dart';
import 'package:movie_app/presentation/theme/theme_color.dart';
import 'package:movie_app/presentation/theme/theme_text.dart';

class BigPoster extends StatelessWidget {
  final MovieDetailEntity movie;

  const BigPoster({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).primaryColor.withOpacity(0.3),
                Theme.of(context).primaryColor,
              ],
            ),
          ),
          child: Image.network(
            '${ApiConstanst.BASE_IMG_URL}${movie.posterPath}',
            width: ScreenUtil.screenWidth,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ListTile(
            title: Text(
              movie.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(
              movie.releaseDate,
              style: Theme.of(context).textTheme.greySubtitle1,
            ),
            trailing: Text(
              movie.voteAverage.convertToPercentage(),
              style: Theme.of(context).textTheme.violet,
            ),
          ),
        ),
        Positioned(
          left: Sizes.dimen_16.w.toDouble(),
          right: Sizes.dimen_16.w.toDouble(),
          top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h.toDouble(),
          child: MovieDetailAppBar(),
        ),
      ],
    );
  }
}
