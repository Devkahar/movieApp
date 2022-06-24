import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/route_constant.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/size_extension.dart';
import 'package:movie_app/core/api_constants.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/blocs/favourite/favourite_bloc.dart';
import 'package:movie_app/presentation/journeys/movie_detail/movie_detail_arguments.dart';

class FavouriteMovieCard extends StatelessWidget {
  final MovieEntity movie;

  const FavouriteMovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.of(context).pushNamed(RouteList.movie_detail_screen, arguments:MovieDetailarguments( movie.id)),
      child: Container(
        margin: EdgeInsets.only(
          bottom: Sizes.dimen_8.h.toDouble(),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Sizes.dimen_6.w.toDouble(),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            Sizes.dimen_6.w.toDouble(),
          ),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: '${ApiConstanst.BASE_IMG_URL}${movie.posterPath}',
                width: Sizes.dimen_100.h.toDouble(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Sizes.dimen_16.w.toDouble(),
                    vertical: Sizes.dimen_8.w.toDouble()),
                child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => BlocProvider.of<FavouriteBloc>(context)
                        .add(DeleteFavouriteMovieEvent(movie.id)),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
