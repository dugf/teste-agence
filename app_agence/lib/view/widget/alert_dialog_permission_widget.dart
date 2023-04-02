import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class AlertDialogPermissionWidget extends StatelessWidget {
  const AlertDialogPermissionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      content: const Text(
        'Você precisa permitir sua localização atual em Permissão do app.',
        textAlign: TextAlign.justify,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(width: 40),
              GestureDetector(
                child: const Text(
                  'CONFIGURAÇÕES',
                ),
                onTap: () {
                  Geolocator.openLocationSettings();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
