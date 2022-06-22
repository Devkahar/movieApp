import 'package:equatable/equatable.dart';

class CastEntity extends Equatable {
  final String creditId, name, posterPath, character;

  const CastEntity({
    required this.creditId,
    required this.name,
    required this.posterPath,
    required this.character,
  });

  @override
  List<Object?> get props => [creditId];
}
