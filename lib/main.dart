import 'package:flutter/material.dart';
import 'githubflutter.dart';
import 'member.dart';
import 'strings.dart' as strings;


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:  strings.appTitle,
      home: GithubFlutter(),
        theme: ThemeData(primaryColor: Colors.green.shade800),

    );
  }
}





