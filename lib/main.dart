import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/expense_data.dart';
import 'package:flutter_application_1/page/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExprenseData(),
      builder: (context, child) => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
    );
  }
}
