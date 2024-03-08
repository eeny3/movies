// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageStore on HomePageStoreBase, Store {
  late final _$hasMoreAtom =
      Atom(name: 'HomePageStoreBase.hasMore', context: context);

  @override
  bool get hasMore {
    _$hasMoreAtom.reportRead();
    return super.hasMore;
  }

  @override
  set hasMore(bool value) {
    _$hasMoreAtom.reportWrite(value, super.hasMore, () {
      super.hasMore = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'HomePageStoreBase.isLoading', context: context);

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
      Atom(name: 'HomePageStoreBase.movies', context: context);

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

  late final _$searchMoviesAsyncAction =
      AsyncAction('HomePageStoreBase.searchMovies', context: context);

  @override
  Future searchMovies(String query) {
    return _$searchMoviesAsyncAction.run(() => super.searchMovies(query));
  }

  late final _$HomePageStoreBaseActionController =
      ActionController(name: 'HomePageStoreBase', context: context);

  @override
  dynamic resetOnNewQuery() {
    final _$actionInfo = _$HomePageStoreBaseActionController.startAction(
        name: 'HomePageStoreBase.resetOnNewQuery');
    try {
      return super.resetOnNewQuery();
    } finally {
      _$HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasMore: ${hasMore},
isLoading: ${isLoading},
movies: ${movies}
    ''';
  }
}
