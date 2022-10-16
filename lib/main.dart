import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mega_store/modules/Home/Home%20Layout/home_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mega Store',
      theme: ThemeData(
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
            elevation: 0,
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: Colors.transparent)),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeLayout(),
    );
  }
}
