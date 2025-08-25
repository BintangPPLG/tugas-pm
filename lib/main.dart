import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const GoLifeApp());
}

class GoLifeApp extends StatelessWidget {
  const GoLifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GoLife',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}
