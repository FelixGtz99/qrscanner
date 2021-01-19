import 'package:flutter/material.dart';
import 'package:qrscanner/models/scan_model.dart';
import 'package:qrscanner/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';
  Future<ScanModel> nuevoScan(String valor) async {
    final nuevoScan = new ScanModel(valor: valor);
    final id = await DBprovider.db.nuevoScan(nuevoScan);
    nuevoScan.id = id;
    if (this.tipoSeleccionado == nuevoScan.tipo) {
      this.scans.add(nuevoScan);

      notifyListeners();
    }
    return nuevoScan;
  }
  cargarScan()async {
     final scans=await DBprovider.db.getAllScan();
     this.scans=[...scans];
     notifyListeners();
  }
  cargarScanPorTipo(String tipo)async{
       final scans=await DBprovider.db.getScanTipo(tipo);
     this.scans=[...scans];
     this.tipoSeleccionado=tipo;
     notifyListeners();

  }
  borrarTodos()async{
await DBprovider.db.deleteAllScan();
this.scans=[];
notifyListeners();
  }
  borrarScanPorId(int id)async{
    await DBprovider.db.deleteScan(id);
cargarScanPorTipo(this.tipoSeleccionado);
notifyListeners();
  }
}
