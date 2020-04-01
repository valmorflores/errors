/* Database_profile_helper */
 
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wordsContextApp/src/shared/library/Database.dart';

import '../constants.dart';
  
// database table and column names
final String tableProfiles = 'profiles';
final String columnId = '_id';
final String columnProfile = 'profile';
final String columnFrequency = 'frequency';
final String columnToken = 'token';

// data model class
class Profile {
  int id;
  String profile;
  String token;
  int frequency;

  Profile( {profile, token} );

  // convenience constructor to create a Word object
  Profile.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    profile = map[columnProfile];
    if ( map[columnFrequency] == 'null' ){
       map[columnFrequency] = 0;
    }
    else
    {
       frequency = 0; //<int>map[columnFrequency];
    }
    token = map[columnToken];
  }

  // convenience method to create a Map from this Word object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnProfile: profile,
      columnFrequency: frequency,
      columnToken: token
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}

// singleton class to manage the database
class DatabaseProfileHelper {
  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = DATABASE_LOCAL_PROFILE; 
  // Increment this version when you need to change the schema.
  static final _databaseVersion = 1;

  // Make this a singleton class.
  DatabaseProfileHelper._privateConstructor();
  static final DatabaseProfileHelper instance =
      DatabaseProfileHelper._privateConstructor();

  // Only allow a single open connection to the database.
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = new Database( path: _databaseName );
    _database.path = _databaseName;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory;
    String path;
    if ( Platform.isLinux ) {
       path = join( '/tmp/', _databaseName );
    } 
    else
    {
       documentsDirectory = await getApplicationDocumentsDirectory();
       path = join(documentsDirectory.path, _databaseName);
    }
    _database.path = path;
    await _database.openDatabase(path: path,
        version: _databaseVersion, onCreate: _onCreate);
    return _database; 
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE $tableProfiles (
                $columnId INTEGER PRIMARY KEY,
                $columnProfile TEXT NOT NULL,
                $columnToken TEXT,
                $columnFrequency INTEGER NOT NULL
              )
              ''');
  }

  // Database helper methods:

  Future<int> insert({Profile profile}) async {
    var lExiste = false;
    Database db = await database;
    List<Map> result = await db.rawQuery(
        'SELECT * FROM ' + tableProfiles + ' WHERE $columnProfile = ?',
        [profile.profile]);
    result.forEach((row) => lExiste = true);
    if (lExiste) {
      print('item de perfil já existe, atualizando o mesmo');
      update_by_profile(profile, profile.profile);
      return 0;
    } else {
      print('inserindo novo item de perfil');
      print(profile.profile + '=' + profile.token);
      int id = await db.insert(tableProfiles, profile.toMap());
      return id;
    }
  }

  Future<Profile> queryProfile(int id) async {
    Database db = await database;
    //List<Map> maps;// = await db.query(tableProfiles,
    Map<String, dynamic> maps;
    maps = await db.query(tableProfiles,
        columns: [columnId, columnToken, columnProfile, columnFrequency],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Profile.fromMap(maps);
    }
    return null;
  }

  Future<int> update(Profile profile, int id) async {
    Database db = await database;
    int upresult = await db.update(tableProfiles, profile.toMap(),
        where: '$columnId = ?', whereArgs: [id]);
    print(upresult);
    return id;
  }

  Future<int> update_by_profile(Profile profile, String username) async {
    Database db = await database;
    int upresult = await db.update(tableProfiles, profile.toMap(),
        where: '$columnProfile = ?', whereArgs: [username]);
    print(upresult);
    return 1;
  }

  // TODO: queryAllProfiles()
  // TODO: delete(int id)
}


