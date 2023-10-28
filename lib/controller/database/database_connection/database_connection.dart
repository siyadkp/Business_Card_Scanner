import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// Database Connection ---------------------------------------------------------

Future<Database> databaseConnection() async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'business_card.db');

// open the database
  Database database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
    // When creating the db, create the table
    await db.execute('''
  CREATE TABLE BusinessCards (
    id INTEGER PRIMARY KEY,
    name TEXT,
    contactNumber TEXT,
    email TEXT,
    website TEXT
  )
''');
  });
  return database;
}
