

import 'package:equatable/equatable.dart';

class MovieSearchParam extends Equatable{
  final String searchTerm;
  const MovieSearchParam(this.searchTerm);
  @override
  List<Object?> get props => [searchTerm];
}