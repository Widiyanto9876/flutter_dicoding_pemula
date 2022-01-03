import 'package:flutter/material.dart';
import 'package:flutter_dicoding_pemula/news_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Bandung',
      theme: ThemeData(
        fontFamily: "Staatliches-Regular"
      ),
      home: const NewsPage(),
    );
  }
}