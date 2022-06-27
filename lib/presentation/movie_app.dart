import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_app/common/constants/language_constants.dart';
import 'package:movie_app/common/constants/route_constant.dart';
import 'package:movie_app/di/get_it.dart';
import 'package:movie_app/presentation/app_localization.dart';
import 'package:movie_app/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movie_app/presentation/blocs/loading/loading_bloc.dart';
import 'package:movie_app/presentation/blocs/login/login_bloc.dart';
import 'package:movie_app/presentation/fade_page_route.dart';
import 'package:movie_app/presentation/journeys/loading/loading_screen.dart';
import 'package:movie_app/presentation/routes.dart';
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
  late LoadingBloc _loadingBloc;
  late LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _languageBloc = getItInstance<LanguageBloc>();
    _languageBloc.add(LoadPrefferedLanguageEvent());
    _loadingBloc = getItInstance<LoadingBloc>();
    _loginBloc = getItInstance<LoginBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    _languageBloc.close();
    _loadingBloc.close();
    _loginBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>.value(value: _languageBloc),
        BlocProvider<LoadingBloc>.value(value: _loadingBloc),
        BlocProvider<LoginBloc>.value(value: _loginBloc),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (ctx, state) {
          if (state is LanguageLoadedState) {
            return WiredashApp(
              navigatorKey: _navigatorKey,
              languageCode: state.locale.languageCode,
              child: MaterialApp(
                navigatorKey: _navigatorKey,
                debugShowCheckedModeBanner: false,
                title: 'Movie App',
                theme: ThemeData(
                  primaryColor: AppColor.vulcan,
                  scaffoldBackgroundColor: AppColor.vulcan,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  textTheme: ThemeText.getTextTheme(),
                  appBarTheme: const AppBarTheme(elevation: 0),
                ),
                supportedLocales: LanguagesConstants.languages
                    .map((e) => Locale(e.code))
                    .toList(),
                locale: state.locale,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                builder: (ctx, child) {
                  return LoadingScreen(
                    screen: child ?? Container(),
                  );
                },
                initialRoute: RouteList.initial_screen,
                onGenerateRoute: (RouteSettings settings) {
                  final routes = Routes.getRoutes(settings);
                  final WidgetBuilder? builder = routes[settings.name];
                  return FadePageRouteBuilder(
                    builder: builder,
                    settings: settings,
                  );
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
