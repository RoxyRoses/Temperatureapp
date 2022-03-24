import 'package:flutter/material.dart';
import 'package:temperatureapp/view/firstpage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Center(
        child: FirstPage(),
      ),
    );
  }
}
