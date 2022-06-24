import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_app/common/constants/language_constants.dart';
import 'package:movie_app/di/get_it.dart';
import 'package:movie_app/presentation/app_localization.dart';
import 'package:movie_app/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movie_app/presentation/theme/theme_color.dart';
import 'package:movie_app/presentation/theme/theme_text.dart';
import 'package:movie_app/common/screenutil/screenutil.dart';
import 'package:movie_app/presentation/wiredash_app.dart';

import 'journeys/home/home_screen.dart';
import 'theme/theme_color.dart';
import 'theme/theme_text.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  late LanguageBloc _languageBloc;

  @override
  void initState(){
    super.initState();
    _languageBloc = getItInstance<LanguageBloc>();
    _languageBloc.add(LoadPrefferedLanguageEvent());
  }
  @override
  void dispose(){
    super.dispose();
    _languageBloc.close();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return BlocProvider<LanguageBloc>.value(
      value: _languageBloc,
      child: BlocBuilder<LanguageBloc,LanguageState>(
        builder: (ctx,state){
          if(state is LanguageLoadedState){
            return WiredashApp(
              navigatorKey: _navigatorKey ,
              languageCode: state.locale.languageCode,
              child: MaterialApp(
                navigatorKey: _navigatorKey ,
                debugShowCheckedModeBanner: false,
                title: 'Movie App',
                theme: ThemeData(
                  primaryColor: AppColor.vulcan,
                  scaffoldBackgroundColor: AppColor.vulcan,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  textTheme: ThemeText.getTextTheme(),
                  appBarTheme: const AppBarTheme(elevation: 0),
                ),
                supportedLocales: LanguagesConstants.languages.map((e) => Locale(e.code)).toList(),
                locale:state.locale,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                home: const HomeScreen(),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}