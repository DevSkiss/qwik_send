import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

/// A service class to manage the Sembast database instance.
class SembastDatabaseService {
  static const String _dbName = 'fanboost_app.db';
  Database? _database;

  /// Provides access to the Sembast database.
  /// Initializes the database if it hasn't been already.
  Future<Database> get database async {
    if (_database == null
        // ||!_database!.isOpen
        ) {
      await _initDb();
    }
    return _database!;
  }

  Future<void> _initDb() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path, _dbName);
    _database = await databaseFactoryIo.openDatabase(dbPath);
  }

  /// Closes the database connection.
  Future<void> closeDb() async {
    await _database?.close();
    _database = null;
  }
}
