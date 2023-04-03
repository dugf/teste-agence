import 'package:flutter/material.dart';

class MyProducts extends StatelessWidget {
  const MyProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          'Meus produtos',
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
