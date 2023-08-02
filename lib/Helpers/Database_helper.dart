import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import '../data/Animal_Bio_App_Initial_Data.dart';
import '../models/App_model.dart';


class DBHelper{
  DBHelper._();
  static final DBHelper dbHelper = DBHelper._();

  String dbName = "animalBio.db";
  String tableName = "animal_data";
  String colId = "id";
  String colName = "name";
  String colDescription = "description";
  String colPhotoURL = "photo";
  String colType = "type";

  Database? db;

  Future<Database?> initDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, dbName);

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        String sqlQuery = "CREATE TABLE IF NOT EXISTS $tableName($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT, $colDescription TEXT, $colPhotoURL TEXT, $colType TEXT)";
        await db.execute(sqlQuery);
      }
    );
  }

  Future<int> insertData({required String name, required String description,required String image,required String type}) async {
    db = await initDB();
    print(name);
    print(description);
    print(type);
    print(type);

    String sqlQuery = "INSERT INTO $tableName($colName,$colDescription,$colPhotoURL,$colType)VALUES(?,?,?,?);";
    List args = [name,description,image,type];
    return await db!.rawInsert(sqlQuery,args);
  }

  Future<List<Animal>> fetchData() async {
    db = await initDB();
    String sqlQuery = "SELECT * FROM $tableName WHERE $colType='${selectedAnimalType!.tableName}';";
    List<Map<String,dynamic>> dummy = [];
    List<Map<String,dynamic>> dbData = await db?.rawQuery(sqlQuery) ?? dummy ;
    print("data == $dbData");
    List<Animal> finalData = dbData.map((e) => Animal.fromMap(e)).toList();
    return finalData;
  }
}