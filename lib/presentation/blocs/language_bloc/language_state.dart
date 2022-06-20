part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();
}

class LanguageLoadedState extends LanguageState{

  final Locale locale;
  const LanguageLoadedState(this.locale);
  @override
  // TODO: implement props
  List<Object?> get props => [locale.languageCode];

}