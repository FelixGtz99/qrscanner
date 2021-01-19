import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner/pages/home_page.dart';
import 'package:qrscanner/pages/mapa_page.dart';
import 'package:qrscanner/providers/scan_list_provider.dart';
import 'package:qrscanner/providers/ui_provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>new UiProvider(),),
        ChangeNotifierProvider(create: (_)=>new ScanListProvider(),),
      ],
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR',
        initialRoute: 'home',
        routes: {
          'home':(BuildContext context)=> HomePage(),
          'mapa':(BuildContext context)=> MapaPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepOrange,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepOrange
          )
        ),
      ),
    );
  }
}