import 'package:app_agence/view/login.dart';
import 'package:app_agence/viewmodel/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'teste-flutter-agence',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AppAgence());
}

class AppAgence extends StatelessWidget {
  const AppAgence({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agence Teste',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
    );
  }
}
