import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/usecases/no_params.dart';
import 'package:movie_app/domain/usecases/get_trending.dart';
import 'package:movie_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

part 'movie_carousel_event.dart';

part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;

  MovieCarouselBloc({
    required this.getTrending,
    required this.movieBackdropBloc,
  }) : super(MovieCarouselInitial()) {
    on<CarouselLoadEvent>((event, emit) async {
      print("Event was laoded");
      final movieEighter = await getTrending(NoParams());
      final data = movieEighter.fold(
        (l) => MovieCarouselError(),
        (movies) {
          movieBackdropBloc.add(
            MovieBackdropChangedEvent(
              movies[event.defaultIndex],
            ),
          );
          return MovieCarouselLoaded(
            movies: movies,
            defaultIndex: event.defaultIndex,
          );
        },
      );
      emit(data);
    });
  }

// @override
// Stream<MovieCarouselState> mapEventToState(
//   MovieCarouselEvent event,
// )
}
