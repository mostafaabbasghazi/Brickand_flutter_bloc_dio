import 'package:bolc_persons/rout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppRout rout=AppRout();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute:rout.onGenerateRoute,

    );
  }
}

