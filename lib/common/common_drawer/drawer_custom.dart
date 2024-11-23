 import 'package:flutter/material.dart';

import 'drawertile.dart';

class DrawerCusnton extends StatelessWidget {
  const DrawerCusnton({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(child: ListView(
      children: const [
        Drawertile(iconData: Icons.home, title: 'inicio',page: 0,),
        Drawertile(iconData: Icons.list, title: 'Produtos',page: 1,),
        Drawertile(iconData: Icons.playlist_add_check, title: 'meus pedidos',page: 2,),
        Drawertile(iconData: Icons.location_on, title: 'lojas',page: 3),
      ],
    ),);
  }
}
