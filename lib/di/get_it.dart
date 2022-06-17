import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_app/data/data_source/api_client.dart';
import 'package:movie_app/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/get_playing_now.dart';
import 'package:movie_app/domain/usecases/get_popular.dart';
import 'package:movie_app/domain/usecases/get_trending.dart';
import 'package:movie_app/domain/usecases/get_upcoming.dart';
import 'package:movie_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';

final getInstance = GetIt.I;

Future init() async {
  getInstance.registerLazySingleton<Client>(() => Client());
  getInstance.registerLazySingleton<ApiClient>(() => ApiClient(getInstance()));
  getInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getInstance()));

  getInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getInstance()));
  getInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getInstance()));
  getInstance
      .registerLazySingleton<GetPlayingNow>(() => GetPlayingNow(getInstance()));
  getInstance
      .registerLazySingleton<GetUpcoming>(() => GetUpcoming(getInstance()));
  getInstance.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      getInstance(),
    ),
  );
  getInstance.registerFactory(() => MovieBackdropBloc());
  getInstance.registerFactory(
    () => MovieCarouselBloc(
      getTrending: getInstance(), movieBackdropBloc: getInstance(),
    ),
  );
}
