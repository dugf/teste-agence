import 'package:app_agence/view/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(const AppAgence());

class AppAgence extends StatelessWidget {
  const AppAgence({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teste Agence',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
    );
  }
}
