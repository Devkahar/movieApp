import 'package:hive/hive.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

part 'movie_table.g.dart';

@HiveType(typeId: 0)
class MovieTable extends MovieEntity {
  @override
  @HiveField(0)
  final int id;

  @override
  @HiveField(1)
  final String title;

  @override
  @HiveField(2)
  final String posterPath;

  MovieTable(
    this.id,
    this.title,
    this.posterPath,
  ) : super(
          id: id,
          overview: '',
          voterAverage: 0,
          releaseDate: '',
          posterPath: posterPath,
          backDropPath: '',
          title: title,
        );

  factory MovieTable.fromMovieEntity(MovieEntity movieEntity) {
    return MovieTable(
      movieEntity.id,
      movieEntity.title,
      movieEntity.posterPath,
    );
  }
}
