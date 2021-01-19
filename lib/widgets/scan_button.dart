import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner/providers/scan_list_provider.dart';
import 'package:qrscanner/utils/utils.dart';
class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      
      child:Icon(Icons.filter_center_focus) ,
      onPressed:() async{
        //Con este se habilita QR
      // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8DEF',    'Cancelar', false, ScanMode.QR);
           
           //Con estos dos Barcode son para estaticos de prueba
            final barcodeScanRes='https://www.udemy.com/course/flutter-ios-android-fernando-herrera/learn/lecture/23418420#questions';                                            
            //final barcodeScanRes='geo:29.129661,-110.985410';            
          final scanListProvider= Provider.of<ScanListProvider>(context,listen: false); 
                  if(barcodeScanRes=='-1'){
                    return;
                  }
         final nuevoScan= await scanListProvider.nuevoScan(barcodeScanRes);        
          launchURL(context, nuevoScan) ;   
      },
    );
  }
}