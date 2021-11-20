import 'package:final_ing_2/pages/ficha_page.dart';
import 'package:final_ing_2/pages/listado_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CarShowRoom',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '',
      routes: {
        '': (context) => ListadoPage(),
        'ficha': (context) => FichaPage()
      },
    );
  }
}
