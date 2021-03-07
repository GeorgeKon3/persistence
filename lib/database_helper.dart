import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void DatabaseHelper(User user) async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  final Future<Database> database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'users_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, hairColor TEXT, isLogin INTEGER)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  Future<void> insertUser(User user) async {
    // Get a reference to the database.
    final Database db = await database;

    // Insert the Dog into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same dog is inserted
    // multiple times, it replaces the previous data.
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<User>> users() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('users');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(
      maps.length,
      (i) {
        return User(
          id: maps[i]['id'],
          name: maps[i]['name'],
          hairColor: maps[i]['hairColor'],
          isLogin: maps[i]['isLogin'],
        );
      },
    );
  }

  Future<void> updateUser(User user) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'users',
      user.toMap(),
      // Ensure that the Dog has a matching id.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [user.id],
    );
  }

  Future<void> deleteUser(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'users',
      // Use a `where` clause to delete a specific dog.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  // var fido = User(
  //   id: 0,
  //   name: 'Fido',
  //   hairColor: 'brown',
  //   isLogin: 1,
  // );

  // Insert a dog into the database.
  await insertUser(user);

  // Print the list of dogs (only Fido for now).
  print(await users());

  // Update Fido's age and save it to the database.
  // fido = User(
  //   id: fido.id,
  //   name: fido.name,
  //   hairColor: fido.hairColor,
  //   isLogin: 1,
  // );
  //await updateUser(fido);

  // Print Fido's updated information.
  print(await users());

  // Delete Fido from the database.
  //await deleteUser(fido.id);

  // Print the list of dogs (empty).
  print(await users());
}

class User {
  final int id;
  final String name;
  final String hairColor;
  final int isLogin;

  User({
    this.isLogin,
    this.hairColor,
    this.id,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'age': hairColor, 'isLogin': isLogin};
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'User{id: $id, name: $name, hairColor: $hairColor, isLogin: $isLogin}';
  }
}
