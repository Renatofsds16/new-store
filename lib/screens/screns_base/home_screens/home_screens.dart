import 'package:flutter/material.dart';
import 'package:new_store/models/home_manage.dart';
import 'package:provider/provider.dart';

import '../../../common/common_drawer/drawer_custom.dart';
import '../section_list.dart';

class HomeScreens extends StatelessWidget {
  HomeScreens({super.key});

  List<Widget> teste = [Text('1'),Text('jfdkdkkjkfdjk'),Text('2')];

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
              Consumer<HomeManager>(
                builder: (_, homeManager,__) {
                  final  List<Widget> children = homeManager.sections.map((section){
                    switch(section.type){
                      case 'list':
                        return SectionList(section: section,);
                      case 'staggered':
                        return Container();
                      default:
                        return Container();
                    }

                  }).toList();
                  return SliverList(
                      delegate: SliverChildListDelegate(children)
                  );
                },

              )
            ],
          )
        ],
      ),
    );
  }
}
