import 'package:app_agence/controller/app_controller.dart';
import 'package:app_agence/controller/connection_manager_controller.dart';
import 'package:app_agence/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AppController appController = Get.put(AppController());
  final ConnectionManagerController _controller =
      Get.find<ConnectionManagerController>();

  final snackBarLogin = const SnackBar(
    content: Text(
        'Serviço indisponível no momento. Faça Login com a sua conta do Google ou Facebook!'),
  );
  final snackBarInternet = const SnackBar(
    content: Text('Falha na conexão com a internet!'),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.indigo[900],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/agence.png',
                ),
                Column(
                  children: [
                    TextFormField(
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            child: const Text(
                              'Esqueci minha senha',
                              style: TextStyle(color: Colors.grey),
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBarLogin);
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(snackBarLogin);
                        },
                        child: const Text(
                          'Entrar',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () async {
                            if (_controller.connectionType.value == 1) {
                              var result =
                                  await appController.signInWithFacebook();

                              if (result.user != null) {
                                if (!mounted) return;
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => const Home(),
                                    ),
                                    (Route<dynamic> route) => false);
                              } else {
                                const SnackBar(
                                    content:
                                        Text('Erro ao logar com Facebook!'));
                              }
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBarInternet);
                            }
                          },
                          child: Text(
                            'Login com Facebook',
                            style: TextStyle(color: Colors.indigo[900]),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () async {
                            if (_controller.connectionType.value == 1) {
                              var result =
                                  await appController.signInWithGoogle();

                              if (result.user != null) {
                                if (!mounted) return;
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => const Home(),
                                    ),
                                    (Route<dynamic> route) => false);
                              } else {
                                const SnackBar(
                                    content: Text('Erro ao logar com Google!'));
                              }
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBarInternet);
                            }
                          },
                          child: Text('Login com Google',
                              style: TextStyle(color: Colors.yellow[900])),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
