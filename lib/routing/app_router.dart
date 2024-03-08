import 'package:auto_route/auto_route.dart';
import 'package:app_fox_movies/pages/home_page/home_page.dart';
import 'package:app_fox_movies/pages/favourites_page/favourites_page.dart';
import 'package:app_fox_movies/pages/movie_info_page/movie_info_page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      initial: true,
      page: HomeRoute.page,
    ),
    AutoRoute(
      page: MovieInfoRoute.page,
    ),
    AutoRoute(
      page: FavouritesRoute.page,
    ),
  ];
}