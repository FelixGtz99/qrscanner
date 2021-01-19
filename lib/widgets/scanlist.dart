import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner/providers/scan_list_provider.dart';
import 'package:qrscanner/utils/utils.dart';
class ScanLists extends StatelessWidget {
  final String tipo;

  const ScanLists({@required this.tipo}) ;
  @override
  Widget build(BuildContext context) {
     final scanListProvider= Provider.of<ScanListProvider>(context); 
     final scans=scanListProvider.scans;
    return ListView.builder(
      itemCount:scans.length,
      itemBuilder: (_,i)=>Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (DismissDirection direction){
                scanListProvider.borrarScanPorId(scans[i].id);
              },
              child: ListTile(
          leading:Icon(
            this.tipo=='http'?Icons.home_outlined :
            Icons.map_outlined,
            color:Theme.of(context).primaryColor,),
          title: Text(scans[i].valor),
          subtitle: Text(scans[i].id.toString()),
          trailing: Icon(Icons.keyboard_arrow_right, color:  Colors.grey,),
          onTap: ()=>launchURL(context, scans[i]),
        ),
      )
      );
  }
  }
