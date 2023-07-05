import 'package:catatan/app/helper/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  // Singleton pattern
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, 'users.db');

    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT)',
    );
  }

  Future<int> insertUser(UserModel user) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    final res = await db.insert(
      'users',
      user.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return res;
  }

  Future<List<UserModel>> users() async {
    final db = await _databaseService.database;

    final List<Map<String, dynamic>> maps = await db.query('users');

    return List.generate(
        maps.length, (index) => UserModel.fromJson(maps[index]));
  }

  Future<UserModel> user(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
        await db.query('users', where: 'id = ?', whereArgs: [id]);
    return UserModel.fromJson(maps[0]);
  }

  Future<UserModel?> login(String username, String password) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'username = ? and password = ?',
      whereArgs: [username, password],
    );
    if (maps.isEmpty) {
      return null;
    } else {
      return UserModel.fromJson(maps[0]);
    }
  }

  // A method that updates a user data from the users table.
  Future<void> updateUser(UserModel user) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Update the given user
    await db.update(
      'users',
      user.toJson(),
      // Ensure that the user has a matching id.
      where: 'id = ?',
      // Pass the user's id as a whereArg to prevent SQL injection.
      whereArgs: [user.id],
    );
  }

  // A method that deletes a user data from the users table.
  Future<void> deleteUser(int id) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Remove the user from the database.
    await db.delete(
      'users',
      // Use a `where` clause to delete a specific user.
      where: 'id = ?',
      // Pass the user's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}
