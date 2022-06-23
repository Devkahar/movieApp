
import 'package:hive/hive.dart';
import 'package:movie_app/data/tabels/movie_table.dart';

abstract class MovieLocalDataSource{
  Future<void> saveMovie(MovieTable movieTable);
  Future<void> deleteMovie(int movieId);
  Future<bool> checkIfMovieFavourite(int movieId);
  Future<List<MovieTable>> getMovies();

}

class MovieLocalDataSourceImpl extends MovieLocalDataSource{
  @override
  Future<bool> checkIfMovieFavourite(int movieId) async{
    final movieBox = await Hive.openBox('movieBox');
    return movieBox.containsKey(movieId);
  }

  @override
  Future<void> deleteMovie(int movieId) async{
    final movieBox = await Hive.openBox('movieBox');
    await movieBox.delete(movieId);
  }

  @override
  Future<List<MovieTable>> getMovies()async {
    final movieBox = await Hive.openBox('movieBox');
    final movieIds = movieBox.keys;
    List<MovieTable> movies =[];
    movieIds.forEach((id) {
      movies.add(movieBox.get(id));
    });
    return movies;
  }

  @override
  Future<void> saveMovie(MovieTable movieTable) async{
    final movieBox = await Hive.openBox('movieBox');
    await movieBox.put(movieTable.id, movieTable);
  }

}