import 'package:movie_app/common/constants/translation_constants.dart';
import 'package:movie_app/presentation/journeys/home/movie_tab/tab.dart';

class MovieTabConstants {
  static List<Tab> tabs = [
    Tab(title: TranslationConstant.popular, index: 0),
    Tab(title: TranslationConstant.now, index: 1),
    Tab(title:TranslationConstant.soon, index: 2),
  ];
}
