import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable{
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
  @override
  List<Object> get props => [id,title];
  @override
  bool get stringify => true;
}
