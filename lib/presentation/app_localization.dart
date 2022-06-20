import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/common/constants/language_constants.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(context) => Localizations.of<AppLocalizations>(context,AppLocalizations);

  Map<String,String> _localizedStrings ={};
  Future<bool> load()async {
    try{
      final jsonString  = await rootBundle.loadString('assets/languages/${locale.languageCode}.json');
      final Map<String,dynamic> jsonMap = json.decode(jsonString);
      _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value.toString()));
      return true;
    }catch(e){
      return false;
    }
  }

  String? translate(String key){
    return _localizedStrings[key];
  }
  static LocalizationsDelegate<AppLocalizations> delegate = const _AppLocilizationDelegate();
}

class _AppLocilizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocilizationDelegate();
  @override
  bool isSupported(Locale locale) {
    return LanguagesConstants.languages.map((e) => e.code).contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async{
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}
