

import 'package:movie_app/domain/entities/language_entity.dart';

class LanguagesConstants{
  LanguagesConstants._();
  static List<LanguageEntity> languages = [
    LanguageEntity(code: 'en', value: 'English'),
    LanguageEntity(code: 'es', value: 'Spanish'),
  ];
}