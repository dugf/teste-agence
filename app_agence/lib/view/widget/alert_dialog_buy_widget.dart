import 'package:app_agence/view/home.dart';
import 'package:flutter/material.dart';

class AlertDialogBuyWidget extends StatelessWidget {
  const AlertDialogBuyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      title: const Text(
        'CONFIRMAR A COMPRA?',
      ),
      content: const Text(
        'Se deseja realmente efetuar a comprar clique CONFIRMAR. \nCaso contrário, clique em CANCELAR.',
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
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Compra efetuada com sucesso!',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.black,
                        duration: Duration(seconds: 5),
                      ),
                    );

                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => const Home()),
                        (Route<dynamic> route) => false);
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
