import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:qrscanner/models/scan_model.dart';
export 'package:qrscanner/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBprovider {
  static Database _database;
  static final DBprovider db = DBprovider._();
  DBprovider._();
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, 'ScansDB.db');
    print(path);
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          tipo TEXT,
          valor TEXT)
        
       ''');
    });
  }

  Future<int> nuevoScanRow(ScanModel scan) async {
    final id = scan.id;
    final tipo = scan.tipo;
    final valor = scan.valor;
    final db = await database;
    final res = await db.rawInsert('''
    INSERT INTO Scans(id, tipo, valor)
    VALUES($id,'$tipo','$valor');
    ''');
    return res;
  }

  Future<int> nuevoScan(ScanModel scan) async {
    final db = await database;
    final res = await db.insert('Scans', scan.toJson());
    print(res);
    return res;
  }

  Future<ScanModel> getScan(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    print(res);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getAllScan() async {
    final db = await database;
    final res = await db.query('Scans');
    print(res);
    return res.isNotEmpty ? res.map((e) => ScanModel.fromJson(e)).toList() : [];
  }

  Future<List<ScanModel>> getScanTipo(String tipo) async {
    final db = await database;
    final res = await db.query('Scans', where: 'tipo = ?', whereArgs: [tipo]);
    print(res);
    return res.isNotEmpty ? res.map((e) => ScanModel.fromJson(e)).toList() : [];
  }

  Future<int> updateScan(ScanModel scan) async {
    final db = await database;
    final res = await db.update('Scans', scan.toJson(),where: 'id=?',whereArgs: [scan.id]);
    return res;
  }
    Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id=?',whereArgs: [id]);
    return res;
  }
  
    Future<int> deleteAllScan() async {
    final db = await database;
    final res = await db.delete('Scans');
    return res;
  }
}
