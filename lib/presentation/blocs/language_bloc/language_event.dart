part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();
  List<Object?> get props => [];
}

class ToggleLanguageEvent extends LanguageEvent{
  LanguageEntity languageEntity;
  ToggleLanguageEvent(this.languageEntity);
  @override
  List<Object?> get props => [languageEntity.code];
}

class LoadPrefferedLanguageEvent extends LanguageEvent{}
