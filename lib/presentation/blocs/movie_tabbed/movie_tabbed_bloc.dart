import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/usecases/get_playing_now.dart';
import 'package:movie_app/domain/usecases/get_popular.dart';
import 'package:movie_app/domain/usecases/get_upcoming.dart';
import 'package:movie_app/domain/usecases/no_params.dart';

part 'movie_tabbed_event.dart';

part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPopular getPopular;
  final GetPlayingNow getPayingNow;
  final GetUpcoming getUpcoming;

  MovieTabbedBloc(
      {required this.getPopular,
      required this.getPayingNow,
      required this.getUpcoming})
      : super(const MovieTabbedInitial(currentTabIndex: 0)) {
    on<MovieTabChangedEvent>((event, emit) async {
      Either<AppError, List<MovieEntity>> moviesEither = right([]);
      switch (event.currentTabIndex) {
        case 0:
          moviesEither = await getPopular(NoParams());
          break;
        case 1:
          moviesEither = await getPayingNow(NoParams());
          break;
        case 2:
          moviesEither = await getUpcoming(NoParams());
          break;
      }
      final data = moviesEither.fold(
          (l) => MovieTabLoadError(
              appErrorType: l.appErrorType,
              currentTabIndex: event.currentTabIndex), (movies) {
        return MovieTabChange(
            movies: movies, currentTabIndex: event.currentTabIndex);
      });
      emit(data);

    });
  }
}
//Tab error test
// MovieTabLoadError(
// appErrorType: AppErrorType.api,
// currentTabIndex: event.currentTabIndex)