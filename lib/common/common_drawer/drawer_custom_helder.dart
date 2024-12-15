
import 'package:flutter/material.dart';
import 'package:new_store/models/user_manager.dart';
import 'package:provider/provider.dart';

class DrawerCustomHelder extends StatelessWidget {
  DrawerCustomHelder({super.key});
  final UserManager _userManager = UserManager();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.fromLTRB(32, 16, 8, 32),
      child: Consumer<UserManager>(
        builder: (_, userManager, __) {
          return ListView(
            children: [
              Text(
                'Loja do\n ${userManager.userLogged?.name ?? ''}',
                style: const TextStyle(fontSize: 34),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'ola, ${userManager.userLogged?.name ?? ''}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  if(userManager.loggedIn){
                    //Sair aqui
                    userManager.signOut();
                  }else{
                    Navigator.pushNamed(context, '/login');
                  }
                },
                child: Text(
                  userManager.loggedIn ? 'sair' : 'Entrar',
                  style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 16),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
