import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qrscan/pages/direcciones_page.dart';
import 'package:qrscan/pages/mapas_page.dart';
import 'package:qrscan/providers/scan_list_provider.dart';

import 'package:qrscan/providers/ui_provider.dart';

import 'package:qrscan/widgets/custom_navigationbar.dart';
import 'package:qrscan/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(icon: Icon(Icons.delete_forever), onPressed: () =>
            Provider.of<ScanListProvider>(context, listen: false).borrarTodos()
          ),
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    final scanListProvider =  Provider.of<ScanListProvider>(context, listen: false);
    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScanPorTipo('geo');
        return MapasPage();
      case 1:
        scanListProvider.cargarScanPorTipo('http');
        return DireccionesPage();
      default:
        scanListProvider.cargarScanPorTipo('geo');
        return MapasPage();
    }
  }
}
