import 'package:apptesis/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Tesis',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), 
    );
  }
}
