import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/movie_param.dart';
import 'package:movie_app/domain/usecases/check_if_favourie_movie.dart';
import 'package:movie_app/domain/usecases/delete_favourite_movie.dart';
import 'package:movie_app/domain/usecases/get_favourite_movies.dart';
import 'package:movie_app/domain/usecases/no_params.dart';
import 'package:movie_app/domain/usecases/save_movie.dart';

part 'favourite_event.dart';

part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final SaveMovie saveMovie;
  final GetFavouriteMovies getFavouriteMovies;
  final DeleteFavouriteMovie deleteFavouriteMovie;
  final CheckIsFavouriteMovie checkIsFavouriteMovie;


  FavouriteBloc({
    required this.saveMovie,
    required this.getFavouriteMovies,
    required this.deleteFavouriteMovie,
    required this.checkIsFavouriteMovie,
  }) : super(FavouriteInitial()) {
    on<DeleteFavouriteMovieEvent>(
      (event, emit) async {
        await deleteFavouriteMovie(MovieParam(event.movieId));
        final res = await checkIsFavouriteMovie(MovieParam(event.movieId));
        final data =res.fold((l) => FavouriteMovieError(), (r) => IsFavourite(r));
        emit(data);
      },
    );
    on<ToggleFavouriteMovieEvent>(
      (event, emit) async {
       bool isFavourite = event.isFavourite;
       if(isFavourite){
         await deleteFavouriteMovie(MovieParam(event.movie.id));
       }else{
         await saveMovie(event.movie);
       }
       final res = await checkIsFavouriteMovie(MovieParam(event.movie.id));
       final data =res.fold((l) => FavouriteMovieError(), (r) => IsFavourite(r));
       emit(data);
      },
    );
    on<CheckIfFavouriteMovieEvent>((event, emit) async {
      final res = await checkIsFavouriteMovie(MovieParam(event.movieId));
      final data =res.fold((l) => FavouriteMovieError(), (r) => IsFavourite(r));
      emit(data);
    });
    on<FavouriteMovieLoadEvent>((event, emit) async {
      final res = await getFavouriteMovies(NoParams());
      final data =res.fold((l) => FavouriteMovieError(), (r) => FavouriteMovieLoaded(r));
      emit(data);
    });
  }
}
