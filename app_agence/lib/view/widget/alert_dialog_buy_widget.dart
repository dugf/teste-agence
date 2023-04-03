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
        'Se você deseja realmente efetuar a compra clique em CONFIRMAR. \nCaso contrário, clique em CANCELAR.',
        textAlign: TextAlign.justify,
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: const Text('CANCELAR',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 30),
              GestureDetector(
                  child: const Text(
                    'CONFIRMAR',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
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
