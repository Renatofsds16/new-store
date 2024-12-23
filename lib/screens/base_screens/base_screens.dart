import 'package:flutter/material.dart';
import 'package:new_store/models/page_manager.dart';
import 'package:new_store/screens/screns_base/home_screens/home_screens.dart';
import 'package:new_store/screens/screns_base/products_screesns.dart';
import 'package:new_store/screens/screns_base/sign_up.dart';
import 'package:provider/provider.dart';

import '../../common/common_drawer/drawer_custom.dart';
import 'login.dart';

class BaseScreens extends StatelessWidget {
  BaseScreens({super.key});
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (BuildContext context) =>
          PageManager(pageController: _pageController),
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            HomeScreens(),
            const ProductsScreesns(),
            Container(
              color: Colors.amber,
            ),
            Container(
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
