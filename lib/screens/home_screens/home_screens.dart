import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_store/common/widgets/section_grid_view.dart';
import 'package:new_store/models/home_manage.dart';
import 'package:provider/provider.dart';

import '../../common/common_drawer/drawer_custom.dart';
import '../../common/widgets/section_list.dart';

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
                iconTheme: const IconThemeData(color: Colors.white),
                elevation: 0,
                snap: true,
                floating: true,
                backgroundColor: Colors.transparent,
                flexibleSpace: const FlexibleSpaceBar(
                  title: Text('loja do Renato',style: TextStyle(color: Colors.white),),
                  centerTitle: true,
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/cart');
                      },
                      icon: const Icon(Icons.shopping_cart,color: Colors.white,))
                ],
              ),
              Consumer<HomeManager>(
                builder: (_, homeManager,__) {
                  final  List<Widget> children = homeManager.sections.map((section){
                    switch(section.type){
                      case 'Staggered':
                        return SectionGridView(section: section);
                      case 'List':
                        return SectionList(section: section,);

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
      floatingActionButton: FloatingActionButton(onPressed: ()async {
        ImagePicker imagePicker = ImagePicker();
        await imagePicker.pickImage(source: ImageSource.camera);
      },child: const Icon(Icons.camera_alt),),
    );
  }
}
