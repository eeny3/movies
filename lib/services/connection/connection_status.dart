import 'dart:io';
import 'dart:async';
import 'package:app_fox_movies/services/storage/db_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
class ConnectionStatusSingleton {
  bool hasConnection = true;
  final DBHelper storage = GetIt.I();
  final db = FirebaseFirestore.instance;

  StreamController connectionChangeController = StreamController.broadcast();

  StreamController notificationCountController = StreamController.broadcast();

  final Connectivity _connectivity = Connectivity();

  void initialize() {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
    checkConnection();
  }

  Stream get connectionChange => connectionChangeController.stream;

  Stream get bildirimSayisiChange => notificationCountController.stream;

  void dispose() {
    connectionChangeController.close();
    notificationCountController.close();
  }

  void _connectionChange(ConnectivityResult result) async {
    print("_connectivity connection changed: $result");
    if (result != ConnectivityResult.none) {
      await checkConnection();
    } else {
      hasConnection = false;
    }
  }

  Future<bool> checkConnection() async {
    bool previousConnection = hasConnection;

    String requestURL = "https://api.kinopoisk.dev/";

    try {
      final response = await http
          .get(Uri.parse(requestURL))
          .timeout(const Duration(seconds: 3));

      if (response.statusCode == 200) {
        hasConnection = true;
        var pendingFavourites = await storage.getPending();
        if (pendingFavourites.isNotEmpty) {
          for (var pendingFavourite in pendingFavourites) {
            await db
                .collection("favourites")
                .doc(
                  pendingFavourite['id'].toString(),
                ).delete();
          }
          await storage.truncatePending();
        }
      } else {
        hasConnection = false;
      }
    } on TimeoutException catch (_) {
      hasConnection = false;
    } on SocketException catch (_) {
      hasConnection = false;
    }

    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }
    print("Am I Online? --->  $hasConnection");
    return hasConnection;
  }
}

final connectionStatus = ConnectionStatusSingleton();
