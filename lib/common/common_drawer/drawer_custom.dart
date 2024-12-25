 import 'package:flutter/material.dart';
import 'package:new_store/models/user_manager.dart';
import 'package:provider/provider.dart';

import 'drawer_custom_helder.dart';
import 'drawertile.dart';

class DrawerCusnton extends StatelessWidget {
  const DrawerCusnton({super.key});

  @override
  Widget build(BuildContext context) {
    return
        Drawer(
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: const [
                    Color.fromARGB(255, 203, 236, 241),
                    Colors.white
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              ),
              ListView(
                children: [
                  DrawerCustomHelder(),
                  const Padding(
                    padding: EdgeInsets.all(16),
                      child: const Divider()
                  ),
                  const Drawertile(iconData: Icons.home, title: 'inicio',page: 0,),
                  const Drawertile(iconData: Icons.list, title: 'Produtos',page: 1,),
                  const Drawertile(iconData: Icons.playlist_add_check, title: 'meus pedidos',page: 2,),
                  const Drawertile(iconData: Icons.location_on, title: 'lojas',page: 3),
                  Consumer<UserManager>(
                      builder: (_,userManager,__){
                        if(userManager.adminEnabled){
                          return const Column(
                             children: [
                              Drawertile(iconData: Icons.settings, title: "Usuarios", page: 4),
                              Drawertile(iconData: Icons.settings, title: 'Pedidos', page: 5),
                            ],
                          );
                        }
                        return Container();
                      }
                  )
                ],
              )

            ],
          ),

    );
  }
}
