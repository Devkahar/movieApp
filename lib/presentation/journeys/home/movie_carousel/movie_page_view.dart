import 'package:flutter/material.dart';
import 'package:movie_app/common/extensions/size_extension.dart';
import 'package:movie_app/common/screenutil/screenutil.dart';
import 'package:movie_app/presentation/journeys/home/movie_carousel/movie_card_widget.dart';

import '../../../../common/constants/size_constants.dart';
import '../../../../domain/entities/movie_entity.dart';

class MoviePageView extends StatefulWidget {
  const MoviePageView(
      {Key? key, required this.movies, required this.initialPage})
      : super(key: key);
  final List<MovieEntity> movies;
  final int initialPage;

  @override
  State<MoviePageView> createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }


  @override
  Widget build(BuildContext context) {
    print(widget.movies);
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h.toDouble()),
      height: ScreenUtil.screenHeight * .35,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (ctx, index) {
          final movieEntity = widget.movies[index];
            return MovieCardWidget(movieId: movieEntity.id, posterPath: movieEntity.posterPath);
        },
        pageSnapping: true,
        itemCount: widget.movies.length,
        onPageChanged: (idx){},
      ),

    );
  }
}
