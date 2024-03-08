// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_fox_movies/pages/favourites_page/favourites_page_store.dart'
    as _i8;
import 'package:app_fox_movies/pages/home_page/home_page_store.dart' as _i9;
import 'package:app_fox_movies/pages/movie_info_page/movie_info_page_store.dart'
    as _i10;
import 'package:app_fox_movies/repositories/movie_repository.dart' as _i7;
import 'package:app_fox_movies/services/connection/connection_status.dart'
    as _i3;
import 'package:app_fox_movies/services/modules/network.dart' as _i11;
import 'package:app_fox_movies/services/networking/client.dart' as _i6;
import 'package:app_fox_movies/services/storage/db_helper.dart' as _i4;
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i3.ConnectionStatusSingleton>(
        () => _i3.ConnectionStatusSingleton());
    gh.lazySingleton<_i4.DBHelper>(() => _i4.DBHelper());
    gh.lazySingleton<_i5.Dio>(() => networkModule.getDio());
    gh.lazySingleton<_i6.RestClient>(
        () => _i6.RestClient.create(gh<_i5.Dio>()));
    gh.lazySingleton<_i7.MovieRepository>(
        () => _i7.MovieRepository(gh<_i6.RestClient>()));
    gh.factory<_i8.FavouritesPageStore>(
        () => _i8.FavouritesPageStore(gh<_i7.MovieRepository>()));
    gh.lazySingleton<_i9.HomePageStore>(
        () => _i9.HomePageStore(gh<_i7.MovieRepository>()));
    gh.factory<_i10.MovieInfoPageStore>(() => _i10.MovieInfoPageStore(
          gh<_i7.MovieRepository>(),
          gh<int>(),
          gh<int>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i11.NetworkModule {}
