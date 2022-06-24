import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_app/data/data_source/api_client.dart';
import 'package:movie_app/data/data_source/language_local_data_source.dart';
import 'package:movie_app/data/data_source/movie_local_data_source.dart';
import 'package:movie_app/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/data/repositories/app_respository.dart';
import 'package:movie_app/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/domain/repositories/app_repository.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/check_if_favourie_movie.dart';
import 'package:movie_app/domain/usecases/delete_favourite_movie.dart';
import 'package:movie_app/domain/usecases/get_crewcast.dart';
import 'package:movie_app/domain/usecases/get_favourite_movies.dart';
import 'package:movie_app/domain/usecases/get_movie_detail.dart';
import 'package:movie_app/domain/usecases/get_playing_now.dart';
import 'package:movie_app/domain/usecases/get_popular.dart';
import 'package:movie_app/domain/usecases/get_preffered_language.dart';
import 'package:movie_app/domain/usecases/get_searched_movie.dart';
import 'package:movie_app/domain/usecases/get_trending.dart';
import 'package:movie_app/domain/usecases/get_upcoming.dart';
import 'package:movie_app/domain/usecases/get_video.dart';
import 'package:movie_app/domain/usecases/save_movie.dart';
import 'package:movie_app/domain/usecases/update_language.dart';
import 'package:movie_app/presentation/blocs/cast/cast_bloc.dart';
import 'package:movie_app/presentation/blocs/favourite/favourite_bloc.dart';
import 'package:movie_app/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_app/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:movie_app/presentation/blocs/videos/video_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(
    () => Client(),
  );
  getItInstance.registerLazySingleton<ApiClient>(
    () => ApiClient(
      getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(
      getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<MovieLocalDataSource>(
    () => MovieLocalDataSourceImpl(),
  );
  getItInstance.registerLazySingleton<LanguageLocalDataSource>(
    () => LanguageLocalDataSourceImpl(),
  );
  getItInstance.registerLazySingleton<UpdateLanguage>(
    () => UpdateLanguage(getItInstance()),
  );
  getItInstance.registerLazySingleton<GetPrefferdLanguage>(
    () => GetPrefferdLanguage(getItInstance()),
  );

  getItInstance.registerLazySingleton<GetTrending>(
    () => GetTrending(
      getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<GetPopular>(
    () => GetPopular(
      getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<GetPlayingNow>(
    () => GetPlayingNow(
      getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<GetUpcoming>(
    () => GetUpcoming(
      getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<GetCast>(
    () => GetCast(
      getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<GetVideos>(
    () => GetVideos(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      getItInstance(),
      getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<GetMovieDetail>(
    () => GetMovieDetail(
      getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<GetSearchMovies>(
    () => GetSearchMovies(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<SaveMovie>(
    () => SaveMovie(
      getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<DeleteFavouriteMovie>(
    () => DeleteFavouriteMovie(
      getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<CheckIsFavouriteMovie>(
    () => CheckIsFavouriteMovie(
      getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<GetFavouriteMovies>(
    () => GetFavouriteMovies(
      getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<LanguageBloc>(
    () => LanguageBloc(
      updateLanguage: getItInstance(),
      getPrefferdLanguage: getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(getItInstance()),
  );

  getItInstance.registerFactory(
    () => MovieBackdropBloc(),
  );
  getItInstance.registerFactory(
    () => MovieCarouselBloc(
      getTrending: getItInstance(),
      movieBackdropBloc: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => MovieTabbedBloc(
      getPopular: getItInstance(),
      getPayingNow: getItInstance(),
      getUpcoming: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => MovieDetailBloc(
      getMovieDetail: getItInstance(),
      castBloc: getItInstance(),
      videoBloc: getItInstance(),
      favouriteBloc: getItInstance(),
    ),
  );
  getItInstance.registerFactory(
    () => CastBloc(
      getCast: getItInstance(),
    ),
  );
  getItInstance.registerFactory(
    () => VideoBloc(
      getVideos: getItInstance(),
    ),
  );
  getItInstance.registerFactory(
    () => SearchMovieBloc(
      getSearchMovie: getItInstance(),
    ),
  );
  getItInstance.registerFactory(
    () => FavouriteBloc(
      checkIsFavouriteMovie: getItInstance(),
      getFavouriteMovies: getItInstance(),
      deleteFavouriteMovie: getItInstance(),
      saveMovie: getItInstance(),
    ),
  );
}
