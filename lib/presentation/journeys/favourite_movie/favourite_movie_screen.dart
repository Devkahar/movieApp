import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/di/get_it.dart';
import 'package:movie_app/presentation/blocs/favourite/favourite_bloc.dart';
import 'package:movie_app/presentation/journeys/favourite_movie/favourite_movies_grid.dart';
import 'package:movie_app/presentation/theme/theme_color.dart';

class FavouriteMovieScreen extends StatefulWidget {
  const FavouriteMovieScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteMovieScreen> createState() => _FavouriteMovieScreenState();
}

class _FavouriteMovieScreenState extends State<FavouriteMovieScreen> {
  late final FavouriteBloc _favouriteBloc;
  @override
  void initState(){
    super.initState();
    _favouriteBloc = getItInstance<FavouriteBloc>();
    _favouriteBloc.add(const FavouriteMovieLoadEvent());

  }
  @override
  void dispose(){
    _favouriteBloc.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _favouriteBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.vulcan,
          title: const Text('Favourite Movies'),
        ),
        body: const FavouriteMovieGrid(),
      ),
    );
  }
}
