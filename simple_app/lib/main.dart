import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:simple_app/ui/comments/comments_screen.dart';

import 'model/comments.dart';

void main() async {
  await Hive.initFlutter('db');
  Hive.registerAdapter(CommentsAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CommentsScreen(),
    );
  }
}
