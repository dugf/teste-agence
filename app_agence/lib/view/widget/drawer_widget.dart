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
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Perfil',
              style: TextStyle(color: Colors.indigo[900], fontSize: 24),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Profile(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: Text('Meus Produtos',
                style: TextStyle(color: Colors.indigo[900], fontSize: 24)),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MyProducts(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: Text('Configurações',
                style: TextStyle(color: Colors.indigo[900], fontSize: 24)),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Settings(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: Text('Logout',
                style: TextStyle(color: Colors.indigo[900], fontSize: 24)),
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
