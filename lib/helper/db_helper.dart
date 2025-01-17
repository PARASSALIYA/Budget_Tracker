import 'package:budget_tracker/model/category_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();
  static DBHelper dbHelper = DBHelper._();
  String tableName = 'category';
  String categoryName = 'categoryName';
  String categoryImage = 'categoryImage';
  String categoryID = 'categoryID';
  String categoryImageIndex = 'categoryImageIndex';
  Database? db;
  // initDB
  Future<void> initDB() async {
    String path = await getDatabasesPath();
    db = await openDatabase(
      '${path}budget.db',
      version: 1,
      onCreate: (db, version) async {
        String query = '''CREATE TABLE $tableName (
              $categoryID INTEGER PRIMARY KEY AUTOINCREMENT,
              $categoryImageIndex INTEGER NOT NULL,
              $categoryName TEXT NOT NULL,
              $categoryImage TEXT NOT NULL );''';
        await db.execute(query);
      },
    );
  }

  // insertCategoryData
  Future<int?> insertCategoryData(
      {required name, required image, required imageIndex}) async {
    await initDB();
    String query =
        "INSERT INTO $tableName ($categoryName, $categoryImage,$categoryImageIndex) VALUES (?,?,?);";
    List args = [name, image, imageIndex];
    return db?.rawInsert(query, args);
  }

  // fetchCategoryData
  Future<List<CategoryModel>> fetchCategoryData() async {
    await initDB();
    String query = "SELECT * FROM $tableName";
    List<Map<String, dynamic>> data = await db!.rawQuery(query);
    return data.map((e) => CategoryModel.fromMap(e)).toList();
  }

  // searchCategoryData
  Future<List<CategoryModel>> searchCategoryData(String search) async {
    await initDB();

    String query =
        "SELECT * FROM $tableName WHERE $categoryName LIKE '%$search%';";
    List<Map<String, dynamic>> result = await db?.rawQuery(query) ?? [];
    return result.map((e) => CategoryModel.fromMap(e)).toList();
  }

  // deleteCategoryData
  Future<int?> deleteCategoryData(int id) async {
    await initDB();
    String query = "DELETE FROM $tableName WHERE $categoryID = $id";
    return await db?.rawDelete(query);
  }

//  editCategoryData
  Future<int?> editCategoryData(CategoryModel model) async {
    await initDB();

    String query =
        "UPDATE $tableName SET $categoryName = ?,$categoryID = ?,$categoryImage = ? WHERE $categoryID = ${model.id};";
    List args = [
      model.name,
      model.imageIndex,
      model.image,
    ];
    return await db?.rawUpdate(query, args);
  }
}
