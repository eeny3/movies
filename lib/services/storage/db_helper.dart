import 'dart:async';
import 'package:app_fox_movies/data/models/movie_preview_model/movie_preview_model.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

@lazySingleton
class DBHelper {
  Database? _db;

  Future<Database?> get getDb async {
    _db ??= await initializeDb();
    return _db;
  }

  Future<Database> initializeDb() async {
    String dbPath = join(await getDatabasesPath(), "MyApp.db");
    var database = await openDatabase(dbPath, version: 1, onCreate: createDb);
    return database;
  }

  Future<void> createDb(Database db, int version) async {
    await db.execute(
      'CREATE TABLE IF NOT EXISTS "favourites" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,"name" TEXT, "shortDescription" TEXT, "rating" DOUBLE, "poster" TEXT, posterBytes BLOB);',
    );
    await db.execute(
      'CREATE TABLE IF NOT EXISTS "pending" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,"name" TEXT, "shortDescription" TEXT, "rating" DOUBLE, "poster" TEXT, posterBytes BLOB);',
    );
  }

  Future<void> insertFavourite(MoviePreviewModel favourite) async {
    Database? db = await getDb;
    Batch batch = db!.batch();
    batch.insert("favourites", favourite.toStorageMap());
    await batch.commit(noResult: true);
  }

  Future<void> insertPending(MoviePreviewModel favourite) async {
    Database? db = await getDb;
    Batch batch = db!.batch();
    batch.insert("pending", favourite.toStorageMap());
    await batch.commit(noResult: true);
  }

  Future<void> deleteFavourite(int id) async {
    Database? db = await getDb;
    Batch batch = db!.batch();
    batch.delete("favourites", where: 'id = ?', whereArgs: [id]);
    await batch.commit(noResult: true);
  }

  Future<void> deletePending(int id) async {
    Database? db = await getDb;
    Batch batch = db!.batch();
    batch.delete("pending", where: 'id = ?', whereArgs: [id]);
    await batch.commit(noResult: true);
  }

  Future<List<Map<String, dynamic>>> getFavourites() async {
    Database? db = await getDb;
    var result = await db!.query(
      "favourites",
      orderBy: "id DESC",
    );
    return result;
  }

  Future<List<Map<String, dynamic>>> getPending() async {
    Database? db = await getDb;
    var result = await db!.query(
      "pending",
      orderBy: "id DESC",
    );
    return result;
  }

  Future<void> truncatePending() async {
    Database? db = await getDb;
    Batch batch = db!.batch();
    batch.delete("pending");
    await batch.commit(noResult: true);
  }
}
