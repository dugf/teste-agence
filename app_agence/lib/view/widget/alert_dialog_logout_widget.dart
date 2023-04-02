import 'package:app_agence/view/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AlertDialogLogoutWidget extends StatelessWidget {
  const AlertDialogLogoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      title: const Text(
        'DESEJA SAIR?',
      ),
      content: const Text(
        'Se deseja realmente fazer logout da sua conta clique CONFIRMAR. \nCaso contrário, clique em CANCELAR.',
        textAlign: TextAlign.justify,
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: const Text(
                  'CANCELAR',
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 40),
              GestureDetector(
                child: const Text(
                  'CONFIRMAR',
                ),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  FacebookAuth.instance.logOut();
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
