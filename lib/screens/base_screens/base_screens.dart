import 'package:flutter/material.dart';
import 'package:new_store/models/page_manager.dart';
import 'package:new_store/models/user_manager.dart';
import 'package:new_store/screens/home_screens/home_screens.dart';
import 'package:new_store/screens/products_screens/products_screesns.dart';
import 'package:new_store/screens/sign_up_screens/sign_up.dart';
import 'package:provider/provider.dart';

import '../../common/common_drawer/drawer_custom.dart';
import '../admin_user/admin_user_screens.dart';
import '../login_screens/login.dart';

class BaseScreens extends StatelessWidget {
  BaseScreens({super.key});
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Provider(
      create: (BuildContext context) =>
          PageManager(pageController: _pageController),
      child: Scaffold(
        body: Consumer<UserManager>(builder: (_, userManager, __) {
          return PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [
              HomeScreens(),
              const ProductsScreesns(),
              Scaffold(
                drawer: const DrawerCusnton(),
                appBar: AppBar(
                  iconTheme: const IconThemeData(color: Colors.white),
                  backgroundColor: color,
                  title: const Text('meus pedidos',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              Scaffold(
                drawer: const DrawerCusnton(),
                appBar: AppBar(
                  iconTheme: const IconThemeData(color: Colors.white),
                  backgroundColor: color,
                  title: const Text('lojas',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              if (userManager.adminEnabled) ...[
                const AdminUserScreens(),
                Scaffold(
                  drawer: const DrawerCusnton(),
                  appBar: AppBar(
                    iconTheme: const IconThemeData(color: Colors.white),
                    backgroundColor: color,
                    title: const Text(
                      'pedidos',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ]
            ],
          );
        }),
      ),
    );
  }
}
