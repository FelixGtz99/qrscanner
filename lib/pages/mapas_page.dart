import 'package:flutter/material.dart';
import 'package:qrscanner/widgets/scanlist.dart';
class MapasPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ScanLists(tipo: 'geo');
}
}