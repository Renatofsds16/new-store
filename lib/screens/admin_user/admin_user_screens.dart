import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:new_store/common/common_drawer/drawer_custom.dart';
import 'package:new_store/models/admin_user_manager.dart';
import 'package:provider/provider.dart';

class AdminUserScreens extends StatelessWidget {
  const AdminUserScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Scaffold(
      drawer: const DrawerCusnton(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: color,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Usuarios',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<AdminUserManager>(builder: (_, adminUserManager, __) {
        return AlphabetListScrollView(
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(
                  '${adminUserManager.users[index].name}',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                subtitle: Text(
                  '${adminUserManager.users[index].email}',
                  style: const TextStyle(color: Colors.white),
                ),
              );
            },
            strList: adminUserManager.names,
            showPreview: true,
            highlightTextStyle: const TextStyle(color: Colors.white),
            indexedHeight: (index) => 80);
      }),
    );
  }
}
