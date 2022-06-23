
import 'package:equatable/equatable.dart';

class MovieParam extends Equatable{
  final int id;
  const MovieParam(this.id);
  @override
  List<Object> get props => [id];
}