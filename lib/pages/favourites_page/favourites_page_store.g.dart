// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourites_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavouritesPageStore on FavouritesPageStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'FavouritesPageStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$moviesAtom =
      Atom(name: 'FavouritesPageStoreBase.movies', context: context);

  @override
  ObservableList<MoviePreviewModel> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(ObservableList<MoviePreviewModel> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  late final _$getFavouritesAsyncAction =
      AsyncAction('FavouritesPageStoreBase.getFavourites', context: context);

  @override
  Future getFavourites() {
    return _$getFavouritesAsyncAction.run(() => super.getFavourites());
  }

  late final _$deleteFavouriteAsyncAction =
      AsyncAction('FavouritesPageStoreBase.deleteFavourite', context: context);

  @override
  Future deleteFavourite(int index) {
    return _$deleteFavouriteAsyncAction.run(() => super.deleteFavourite(index));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
movies: ${movies}
    ''';
  }
}
