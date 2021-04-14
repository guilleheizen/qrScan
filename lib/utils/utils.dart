
import 'package:flutter/material.dart';
import 'package:qrscan/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(BuildContext context, ScanModel scan ) async {
  final url = scan.valor;

  if (scan.tipo == 'http') {
    if (await canLaunch(url)){
      await launch(url);
    } else {
      throw 'URL no válida: $url'; 
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan );
  }
}
    