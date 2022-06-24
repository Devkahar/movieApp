import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/size_extension.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/blocs/favourite/favourite_bloc.dart';
import 'package:movie_app/presentation/blocs/favourite/favourite_bloc.dart';

class MovieDetailAppBar extends StatelessWidget {
  MovieDetailEntity movieDetailEntity;
  MovieDetailAppBar({Key? key, required this.movieDetailEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: Sizes.dimen_12.h.toDouble(),
          ),
        ),
        BlocBuilder<FavouriteBloc, FavouriteState>(
          builder: (context, state) {
            if(state is IsFavourite){
              return GestureDetector(
                onTap: () => BlocProvider.of<FavouriteBloc>(context).add(ToggleFavouriteMovieEvent(MovieEntity.fromMovieDetailEntity(movieDetailEntity), state.isFavourite)),
                child: Icon(
                  state.isFavourite?Icons.favorite:Icons.favorite_border,
                  color:  state.isFavourite?Colors.redAccent:Colors.white,
                  size: Sizes.dimen_12.h.toDouble(),
                ),
              );
            }
            return Icon(
              Icons.favorite,
              color:  Colors.white,
              size: Sizes.dimen_12.h.toDouble(),
            );
            
          },
        )
      ],
    );
  }
}


