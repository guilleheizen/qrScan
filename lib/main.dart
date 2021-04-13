import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qrscan/pages/home_page.dart';
import 'package:qrscan/pages/mapa_page.dart';
import 'package:qrscan/providers/ui_provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider(),)
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Scanner',
        initialRoute: 'home',
        routes: {
          'home': ( _ ) => HomePage(),
          'mapa': ( _ ) => MapaPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.black,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.black
          )
        ),
      ),
    );
  }
}