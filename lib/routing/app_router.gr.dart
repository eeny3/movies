// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    FavouritesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavouritesPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    MovieInfoRoute.name: (routeData) {
      final args = routeData.argsAs<MovieInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MovieInfoPage(
          key: args.key,
          movieId: args.movieId,
          movieIndex: args.movieIndex,
        ),
      );
    },
  };
}

/// generated route for
/// [FavouritesPage]
class FavouritesRoute extends PageRouteInfo<void> {
  const FavouritesRoute({List<PageRouteInfo>? children})
      : super(
          FavouritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavouritesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MovieInfoPage]
class MovieInfoRoute extends PageRouteInfo<MovieInfoRouteArgs> {
  MovieInfoRoute({
    Key? key,
    required int movieId,
    required int movieIndex,
    List<PageRouteInfo>? children,
  }) : super(
          MovieInfoRoute.name,
          args: MovieInfoRouteArgs(
            key: key,
            movieId: movieId,
            movieIndex: movieIndex,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieInfoRoute';

  static const PageInfo<MovieInfoRouteArgs> page =
      PageInfo<MovieInfoRouteArgs>(name);
}

class MovieInfoRouteArgs {
  const MovieInfoRouteArgs({
    this.key,
    required this.movieId,
    required this.movieIndex,
  });

  final Key? key;

  final int movieId;

  final int movieIndex;

  @override
  String toString() {
    return 'MovieInfoRouteArgs{key: $key, movieId: $movieId, movieIndex: $movieIndex}';
  }
}
