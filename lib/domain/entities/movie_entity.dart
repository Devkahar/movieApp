import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';

class MovieEntity extends Equatable {
  final String backDropPath;
  final int id;
  final String posterPath;
  final String title;
  final double voterAverage;
  final String releaseDate;
  final String overview;

  MovieEntity({
    required this.backDropPath,
    required this.id,
    required this.posterPath,
    required this.title,
    required this.voterAverage,
    required this.releaseDate,
    required this.overview,
  });

  factory MovieEntity.fromMovieDetailEntity(
      MovieDetailEntity movieDetailEntity) {
    return MovieEntity(
      backDropPath: movieDetailEntity.backdropPath,
      id: movieDetailEntity.id,
      posterPath: movieDetailEntity.posterPath,
      title: movieDetailEntity.title,
      voterAverage: movieDetailEntity.voteAverage.toDouble(),
      releaseDate: movieDetailEntity.releaseDate,
      overview: movieDetailEntity.overview,
    );
  }

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;
}
