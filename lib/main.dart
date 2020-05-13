import 'package:cep/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CEP',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
