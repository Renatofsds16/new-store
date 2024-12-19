import 'package:flutter/material.dart';

import '../../../common/common_drawer/drawer_custom.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Scaffold(
      drawer: const DrawerCusnton(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 211, 118, 130),
              Color.fromARGB(255, 253, 181, 168),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0,
                snap: true,
                floating: true,
                backgroundColor: Colors.transparent,
                flexibleSpace: const FlexibleSpaceBar(
                  title: Text('loja do Renato'),
                  centerTitle: true,
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/cart');
                      },
                      icon: const Icon(Icons.shopping_cart))
                ],
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 2000,
                  width: 200,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
