

import 'dart:async';

import 'package:hive/hive.dart';

abstract class LanguageLocalDataSource{
  Future<void> updateLanguage(String languageCode);
  Future<String> getPrefferdLanguage();
}

class LanguageLocalDataSourceImpl extends LanguageLocalDataSource{
  @override
  Future<String> getPrefferdLanguage() async{
    final res = await Hive.openBox('LanguageBox');
    return res.get('prefferd_language')??'en';
  }

  @override
  Future<void> updateLanguage(String languageCode) async{
    final res = await Hive.openBox('LanguageBox');
    unawaited(res.put('prefferd_language', languageCode));
  }

}