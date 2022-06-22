import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/MovieDetailEntity.dart';
import 'package:movie_app/domain/entities/MovieParam.dart';
import 'package:movie_app/domain/usecases/get_movie_detail.dart';
import 'package:movie_app/presentation/blocs/cast/cast_bloc.dart';

part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final CastBloc castBloc;
  MovieDetailBloc({required this.getMovieDetail,required this.castBloc})
      : super(MovieDetailInitial()) {
    on<MovieDetailLoadEvent>((event, emit) async {
      final eighterResponse = await getMovieDetail(MovieParam(event.movieId));
      final data = eighterResponse.fold(
        (l) => MovieDetailError(),
        (movieDetail) => MovieDetailLoaded(movieDetail),
      );
      emit(data);
      castBloc.add(LoadCastEvent(movieId: event.movieId));
    });
  }
}
