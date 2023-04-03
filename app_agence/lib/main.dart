import 'package:app_agence/controller/controller_binding.dart';
import 'package:app_agence/view/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'teste-flutter-agence',
    options: const FirebaseOptions(
        apiKey: "AIzaSyBVtzqFwcGMeCu7k4jhov985O4t_uwC22c",
        appId: "1:406992445296:android:bfc108790b11ff766df9b5",
        messagingSenderId: "",
        projectId: "teste-flutter-agence"),
  );
  runApp(const AppAgence());
}

class AppAgence extends StatelessWidget {
  const AppAgence({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Agence Teste',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
    );
  }
}
