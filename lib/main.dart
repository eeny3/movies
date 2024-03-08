import 'dart:io';

import 'package:app_fox_movies/app.dart';
import 'package:app_fox_movies/services/connection/connection_status.dart';
import 'package:app_fox_movies/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
  }
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeLocator();
  final ConnectionStatusSingleton connectionStatusSingleton = GetIt.I();
  connectionStatusSingleton.initialize();
  runApp(App());
}

