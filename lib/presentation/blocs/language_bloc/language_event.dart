part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();
}

class ToggleLanguageEvent extends LanguageEvent{
  LanguageEntity languageEntity;
  ToggleLanguageEvent(this.languageEntity);
  @override
  List<Object?> get props => [languageEntity.code];

}