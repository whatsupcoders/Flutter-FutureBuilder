import 'package:flutter/material.dart';
import 'BookDashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Book App Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BookDashboard(),
    );
  }
}
