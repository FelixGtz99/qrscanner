import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner/providers/scan_list_provider.dart';
import 'package:qrscanner/widgets/scanlist.dart';
class DireccionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return ScanLists(tipo: 'http');
    
  }
}