import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/size_extension.dart';
import 'package:movie_app/core/api_constants.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:movie_app/presentation/journeys/movie_detail/movie_detail_screen.dart';
import 'package:movie_app/presentation/theme/theme_text.dart';

class SearchMovieCard extends StatelessWidget {
  final MovieEntity movie;

  const SearchMovieCard({Key? key, required this.movie}) : super(key: key);
  final dummy ='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTb4tu6-nBr1Sq7tt6ub0l7XTFnE0OhlPgSVQ&usqp=CAU';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(
              movieDetailarguments: MovieDetailarguments(movie.id),
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_16.w.toDouble(),
          vertical: Sizes.dimen_2.h.toDouble(),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(Sizes.dimen_8.w.toDouble()),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Sizes.dimen_4.w.toDouble()),
                child: CachedNetworkImage(
                  imageUrl: '${ApiConstanst.BASE_IMG_URL}${movie.posterPath}',
                  width: Sizes.dimen_80.w.toDouble(),
                  errorWidget: (ctx,_,__)=> Image.network(dummy),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    movie.overview,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.greyCaption,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
