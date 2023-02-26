// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

class LocalDbService {
  static Database? _database;

  DateTime get nowDate => DateTime.now();

  Future<Database> get database async {
    // if (_database != null) return _database!;
    _database = await _initDB('music_player_db.db');
    return _database!;
  }

  Future<Database> _initDB(dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    var exists = await databaseExists(path);
    if (!exists) {
      var data = await rootBundle.load(
        join('assets', 'db', 'music_player_db.db'),
      );
      List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );
      await File(path).writeAsBytes(bytes, flush: true);
    }
    return await openDatabase(path, readOnly: false);
  }
}
