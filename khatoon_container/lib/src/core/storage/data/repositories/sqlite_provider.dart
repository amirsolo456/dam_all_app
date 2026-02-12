import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:khatoon_shared/index.dart';

import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  // create or open a new database
  static Future<Database> createDatabase() async {
    return await openDatabase(
      "hacker_news.db",
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE news (id INTEGER PRIMARY KEY,title TEXT, url TEXT, author VARCAR(255), updatedAt TEXT)');

        await db.execute(
            'CREATE TABLE saved_time (page_no INTEGER PRIMARY KEY, lastSavedTime DATETIME)');
      },
    );
  }

  // insert new news to the database
  static Future<int> insertNews(User hackerNews) async {
    final Database db = await createDatabase();

    return await db.insert(
        "news",
        <String, TextColumn>{
          // "id": hackerNews.id,
          // "title": hackerNews.title,
          // "url": hackerNews.url,
          // "author": hackerNews.author,
          // "updatedAt": hackerNews.updatedAt
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // read latest 20 news from the local database
  static Future<List<Map<String, dynamic>>> getNews() async {
    final Database db = await createDatabase();
    return await db.query(
      "news",
      orderBy: 'updatedAt DESC',
      limit: 20,
    );
  }

  // get more data but in limit of 20
  static Future<List<Map<String, dynamic>>> getMoreNews(int lastNo) async {
    final Database db = await createDatabase();
    return await db.query("news",
        orderBy: 'updatedAt DESC', limit: 20, offset: lastNo);
  }

  // count the number of news inside database
  static Future<int?> getNewsCount() async {
    final Database db = await createDatabase();
    return Sqflite.firstIntValue(
        await db.rawQuery("SELECT COUNT(*) FROM news"));
  }

  // delete all news from local database
  static Future<int> deleteAllNews() async {
    final Database db = await createDatabase();
    return await db.delete("news");
  }

  // insert time after saving to the database
  static Future<int> insertSaveTime(int pageNo) async {
    final Database db = await createDatabase();
    return await db.insert("saved_time",
        <String, Object>{"page_no": pageNo, "lastSavedTime": DateTime.now().toString()},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //  get the saved time of each page
  static Future<List<Map<String, dynamic>>> getSaveTime() async {
    final Database db = await createDatabase();
    final List<Map<String, Object?>> data = await db.query("saved_time");
    if (kDebugMode) {
      print(data);
    }
    return data;
  }

  // delete the saved time table
  static Future<int> deleteSavedTime() async {
    final Database db = await createDatabase();
    return await db.delete("saved_time");
  }
}