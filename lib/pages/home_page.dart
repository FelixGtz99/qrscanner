import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner/pages/direcciones_page.dart';
import 'package:qrscanner/pages/mapa_page.dart';
import 'package:qrscanner/pages/mapas_page.dart';
import 'package:qrscanner/providers/db_provider.dart';
import 'package:qrscanner/providers/scan_list_provider.dart';
import 'package:qrscanner/providers/ui_provider.dart';
import 'package:qrscanner/widgets/custom_nav.dart';
import 'package:qrscanner/widgets/scan_button.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
             onPressed: (){
                 final scanListProvider= Provider.of<ScanListProvider>(context,listen: false); 
  scanListProvider.borrarTodos();
             }
            )
          
        ],
      ),
      body:_HomePageBody(),
        bottomNavigationBar:CustomNav(),
        floatingActionButton:ScanButton() ,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
 
}
class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider=Provider.of<UiProvider>(context);
    final currentIndex=uiProvider.selectedMenuOpt;
    final tempScan=new ScanModel(valor: 'https://outlook.live.com/mail/0/inbox');
     //DBprovider.db.getScan(2);

    final scanListProvider=Provider.of<ScanListProvider>(context,listen: false);
    switch (currentIndex) {
      case 0:
      scanListProvider.cargarScanPorTipo('geo');
        return MapasPage();
        break;
        
      case 1:
      scanListProvider.cargarScanPorTipo('http');
        return DireccionesPage();
        break;
      default:

    }
  }
 
}