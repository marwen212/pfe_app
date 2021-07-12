
import 'package:association/screens/home_page.dart';
import 'package:association/screens/personne_page.dart';
import 'package:association/screens/scan_qr_code.dart';
import 'package:association/screens/reclamation_page.dart';

import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  static String tag = 'navigation-drawer';
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Material(
        color: Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          children: <Widget>[

            Container(
              padding: padding,
              child: Column(
                children: [

                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Effectuer Vente',
                    icon: Icons.people,
                    onClicked: () {Navigator.of(context).pushNamed(ScanQRCode.tag);},
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Mes Informations',
                    icon: Icons.favorite_border,
                    onClicked: () {Navigator.of(context).pushNamed(HomePage.tag);},
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Envoyer reclamation',
                    icon: Icons.workspaces_outline,
                    onClicked: (){Navigator.of(context).pushNamed(Reclamationpage.tag);},
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget buildMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }


}


