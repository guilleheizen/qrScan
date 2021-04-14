import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qrscan/providers/scan_list_provider.dart';
import 'package:qrscan/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        child: Icon(Icons.filter_center_focus),
        onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              "#ff0000", "Cancelar", false, ScanMode.QR);
          // String barcodeScanRes = 'geo:-25.5100258,-54.609064';
          if ( barcodeScanRes == '-1' ) return false;
          // String barcodeScanRes = 'https://www.megaeletronicos.com';
          final scanListProvider = Provider.of<ScanListProvider>( context, listen:false );
          final scan = await scanListProvider.nuevoScan(barcodeScanRes);
          launchURL(context, scan);
        });
  }
}
