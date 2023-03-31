import 'package:app_agence/view/my_products.dart';
import 'package:app_agence/view/profile.dart';
import 'package:app_agence/view/settings.dart';
import 'package:app_agence/view/widget/alert_dialog_logout_widget.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('BEM VINDOS'),
          ),
          ListTile(
            title: const Text('Perfil'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Profile(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Meus Produtos'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MyProducts(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Configurações'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Settings(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return const AlertDialogLogoutWidget();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
