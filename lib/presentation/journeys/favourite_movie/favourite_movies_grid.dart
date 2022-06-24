import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/size_extension.dart';
import 'package:movie_app/presentation/blocs/favourite/favourite_bloc.dart';
import 'package:movie_app/presentation/journeys/favourite_movie/favourite_movie_card.dart';

class FavouriteMovieGrid extends StatelessWidget {
  const FavouriteMovieGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
      builder: (context, state) {
        if(state is FavouriteMovieLoaded){
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.dimen_16.w.toDouble(),),
            child: GridView.builder(

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .7,
                crossAxisSpacing: Sizes.dimen_16.w.toDouble(),
              ),
              itemBuilder: (ctx,idx)=> FavouriteMovieCard(movie: state.movie[idx]),
              itemCount: state.movie.length,
            ),
          );
        }
        return const Center(child: Text("loading"),);

      },
    );
  }
}
