import 'package:movie_app/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final double? popularity;
  final String? mediaType;

  MovieModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.popularity,
    this.mediaType,
  }) : super(
          id: id,
          title: title,
          backDropPath: backdropPath ?? '',
          posterPath: posterPath,
          releaseDate: releaseDate,
          voterAverage: voteAverage ?? 0.0,
          overview: overview,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: json['genre_ids'].cast<int>(),
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: double.tryParse(json['vote_average'].toString())??0.0,
      voteCount: json['vote_count'],
      popularity: double.tryParse(json['popularity'].toString())??0.0,
      mediaType: json['media_type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    data['popularity'] = popularity;
    data['media_type'] = mediaType;
    return data;
  }
}
