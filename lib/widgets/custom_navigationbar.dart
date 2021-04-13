import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscan/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
        onTap: (int i) => uiProvider.selectedMenuOpt = i,
        currentIndex: currentIndex,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_city), label: 'Direcciones'),
        ]);
  }
}
