import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_store/models/admin_user_manager.dart';
import 'package:new_store/models/cart_manage.dart';
import 'package:new_store/models/home_manage.dart';
import 'package:new_store/models/product.dart';
import 'package:new_store/models/product_manager.dart';
import 'package:new_store/models/user_manager.dart';
import 'package:new_store/screens/base_screens/base_screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:new_store/screens/cart_product_screens/cart_product_screens.dart';
import 'package:new_store/screens/edit_product/edit_product_screens.dart';
import 'package:new_store/screens/login_screens/login.dart';
import 'package:new_store/screens/product_screens/product_screesns.dart';
import 'package:new_store/screens/sign_up_screens/sign_up.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>UserManager(),lazy: false,),
        ChangeNotifierProvider(create: (_)=>HomeManager(),lazy: false,),
        ChangeNotifierProvider(create: (_)=>ProductManager(),lazy: false,),
        ChangeNotifierProxyProvider<UserManager,CartManager?>(create: (_)=>CartManager(),
          lazy: false,
          update: (_, userManager, cartManager) {
          return cartManager?..updateUser(userManager);
          },),
        ChangeNotifierProxyProvider<UserManager,AdminUserManager>(
            create: (_)=> AdminUserManager(),
            update: (_,userManager,adminUserManager)=> adminUserManager!..updateUser(userManager),
          lazy: false,
        )
      ],
      child: MaterialApp(
        initialRoute: '/base',
        theme: ThemeData(
            primaryColor: const Color.fromARGB(255, 4, 125, 141),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141)),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          final args = settings.arguments;
          switch (settings.name) {
            case '/signup':
              return MaterialPageRoute(builder: (_) => const SignUp());
            case '/cart':
              return MaterialPageRoute(builder: (_) => const CartProductScreens());

            case '/productScreens':
              return MaterialPageRoute(builder: (_) => ProductScreesns(args: {'product':args as Product}));
              
            case '/login':
              return MaterialPageRoute(builder: (_) => Login());

            case '/editProductScreens':
              return MaterialPageRoute(builder: (_) => EditProductScreens(product: args as Product,));
            case '/base':
            default:
              return MaterialPageRoute(builder: (_) => BaseScreens());
          }
        },
      ),
    );
  }
}
