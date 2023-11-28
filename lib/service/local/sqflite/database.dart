import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database? _db;

  DatabaseHelper.internal();

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'example.db');

    // Delete the database if it exists
    await deleteDatabase(path);

    // Create the database
    Database db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    // Create tables
    await db.execute('''
      CREATE TABLE user (
        id INTEGER PRIMARY KEY,
        name TEXT,
        image TEXT,
        gitHubUrl TEXT,
        pub_divUrl
      )
    ''');
  }

  // Insert a user into the database
  Future<int> insertUser(User user) async {
    var dbClient = await db;
    return await dbClient!.insert('user', user.toMap());
  }

  // Fetch all users from the database
  Future<List<User>> getUsers() async {
    var dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient!.query('user');
    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
  }
}

class User {
  int? id;
  String? name;
  int? age;

  User({this.id, this.name, this.age});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }
}
