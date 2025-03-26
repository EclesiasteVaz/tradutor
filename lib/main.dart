import 'package:flutter/material.dart';
import 'package:tradutor/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const ScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Tradutor',
      theme: ThemeData.dark(useMaterial3: true),
      home: const HomePage(),
    );
  }
}
