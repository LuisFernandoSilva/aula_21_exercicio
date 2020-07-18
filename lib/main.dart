import 'package:aula_21_fllutter_exercicio/pages/list_page.dart';
import 'package:aula_21_fllutter_exercicio/pages/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cadastro Usuario',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ListRegister(),
      routes: {
        'register_page': (ctx) => RegisterPage(),
      },
    );
  }
}
