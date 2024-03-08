import 'package:app_fox_movies/routing/app_router.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final _router = AppRouter();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'appfox',
      theme: ThemeData(),
      routerConfig: _router.config(),
    );
  }
}
