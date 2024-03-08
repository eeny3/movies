// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_info_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieInfoPageStore on MovieInfoPageStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'MovieInfoPageStoreBase.isLoading', context: context);

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

  late final _$isFavouriteAtom =
      Atom(name: 'MovieInfoPageStoreBase.isFavourite', context: context);

  @override
  bool get isFavourite {
    _$isFavouriteAtom.reportRead();
    return super.isFavourite;
  }

  @override
  set isFavourite(bool value) {
    _$isFavouriteAtom.reportWrite(value, super.isFavourite, () {
      super.isFavourite = value;
    });
  }

  late final _$loadMovieAsyncAction =
      AsyncAction('MovieInfoPageStoreBase.loadMovie', context: context);

  @override
  Future loadMovie() {
    return _$loadMovieAsyncAction.run(() => super.loadMovie());
  }

  late final _$addToFavouriteAsyncAction =
      AsyncAction('MovieInfoPageStoreBase.addToFavourite', context: context);

  @override
  Future addToFavourite() {
    return _$addToFavouriteAsyncAction.run(() => super.addToFavourite());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isFavourite: ${isFavourite}
    ''';
  }
}
