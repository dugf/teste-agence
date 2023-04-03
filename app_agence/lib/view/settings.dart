import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          'Configurações',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
