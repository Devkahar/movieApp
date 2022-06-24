

import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/route_constant.dart';
import 'package:movie_app/presentation/journeys/favourite_movie/favourite_movie_screen.dart';
import 'package:movie_app/presentation/journeys/home/home_screen.dart';
import 'package:movie_app/presentation/journeys/login/login_screen.dart';
import 'package:movie_app/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:movie_app/presentation/journeys/movie_detail/movie_detail_screen.dart';
import 'package:movie_app/presentation/journeys/watch_video/watch_video_arguments.dart';
import 'package:movie_app/presentation/journeys/watch_video/watch_video_screen.dart';

class Routes{
  static Map<String,WidgetBuilder> getRoutes(RouteSettings settings)=>{
    RouteList.initial_screen: (ctx)=>  LoginView(),
    RouteList.home_screen : (ctx)=> const HomeScreen(),
    RouteList.movie_detail_screen: (ctx)=> MovieDetailScreen(movieDetailarguments: settings.arguments as MovieDetailarguments),
    RouteList.watch_trailer_screen: (ctx)=> WatchVideoScreen(watchVideoArguments: settings.arguments as WatchVideoArguments),
    RouteList.favourite_screen: (ctx)=> const FavouriteMovieScreen(),
  };
}