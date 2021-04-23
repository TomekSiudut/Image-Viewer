import 'package:images/models/image_model.dart';
import "package:path/path.dart";
import 'package:sqflite/sqflite.dart';
import "dart:async";
import 'package:sqflite/sqlite_api.dart';
import "package:path_provider/path_provider.dart";
import "dart:io" as io;

class LocalRepository {
  static Database _db;
  static const String ID = 'id';
  static const String IMAGE_ID = "image_id";
  static const String URL = 'imageUrl';
  static const String TITLE = "title";
  static const String TABLE = "Images";
  static const String DB_NAME = "images.db";

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY,$IMAGE_ID TEXT, $URL TEXT, $TITLE TEXT)");
  }

  Future<ImageModel> addNewImage(ImageModel image) async {
    var dbClient = await db;
    dbClient.insert(TABLE, image.toMap()).toString();
    return image;
  }

  Future<List<ImageModel>> getFavImages() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE, columns: [ID, URL, TITLE]);

    List<ImageModel> employees = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        employees.add(ImageModel.fromMap(maps[i]));
      }
    }
    return employees;
  }

  Future<int> deleteImage(int id) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
