import 'package:flutter/material.dart';
import 'package:taaza_khabar/pages/home_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme:  ColorScheme.fromSeed(seedColor:  const Color(0xff381a60),primary:const Color(0xff381a60)),
        //appBarTheme: const AppBarTheme(backgroundColor: Color(0xff241370)),

      ),
      initialRoute: Home.id,
      routes: {
        Home.id:(context)=>const Home(),
      },
    );
  }
}

